#!/usr/bin/python3

import os
import sys
import json
import requests
from dotenv import set_key
from akamai.edgegrid import EdgeGridAuth
from ak_api_wrapper import AkamaiApis


########################################
# Build Akamai API EdgeGrid session object
#########################################

def init_config():

    try:        
        base_url = os.getenv('TF_VAR_akamai_host')
        session = requests.Session()
        session.auth = EdgeGridAuth(
            client_token=os.getenv('TF_VAR_akamai_client_token'),
            client_secret=os.getenv('TF_VAR_akamai_client_secret'),
            access_token=os.getenv('TF_VAR_akamai_access_token')
        )
    except Exception:
        print(f'ERROR: Unknown error occurred trying to read API credentials')
        exit(1)
    return base_url, session


##########################################
# Obtain the Cloud Access Manager Key GUID
##########################################

def get_cam_key_guid(cam_key_id, account_key=None):

    # Initialize the session with Akamai's EdgeGrid Auth
    base_url, session = init_config()
    api_definition_object = AkamaiApis(base_url, account_key)

    response = api_definition_object.get_access_key_versions(session, cam_key_id)

    #print(f"Searching CAM Key ID {cam_key_id} Response {(json.dumps(response.json(), indent=2, sort_keys=False))}")

    response_json_object = json.loads(response.text)


    latest_cam_key_version = None
    for cam_key_version in response_json_object.get('accessKeyVersions'):
        if cam_key_version['deploymentStatus'] == 'ACTIVE':
            if latest_cam_key_version is None or cam_key_version.get('version') > cam_key_version.get('version'):
                latest_cam_key_version = cam_key_version.get('version')
                cam_key_guid = cam_key_version.get('versionGuid')
    return cam_key_guid



def main():

    account_key = os.getenv('TF_VAR_akamai_account_key')
    cam_key_id = sys.argv[1]
    #folder = "."
    #filepath = os.path.join(folder, '.env')
    try: 
        cam_key_guid = get_cam_key_guid(cam_key_id, account_key)
        print(f"cam_key_guid=\"{cam_key_guid}\"")
        #set_key(dotenv_path=filepath, key_to_set="TF_VAR_akamai_cam_key_guid", value_to_set=cam_key_guid)

    except Exception as e:
        print(f'Error {e}')

# Main function
if __name__ == "__main__":
    main()
