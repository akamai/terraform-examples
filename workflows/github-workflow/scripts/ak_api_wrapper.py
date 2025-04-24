class AkamaiApis:
    def __init__(self, access_hostname, account_switch_key):
        self.access_hostname = access_hostname
        if account_switch_key is not None:
            self.account_switch_key = '&accountSwitchKey=' + account_switch_key
        else:
            self.account_switch_key = ''

    def search_property(self, session, payload):
        url = f'https://{self.access_hostname}/papi/v1/search/find-by-value'
        response = session.post(self.form_url(url), json=payload)
        return response

    def get_property_rule_tree(self, session, property_id, property_version, contract_id, group_id):
        url = f'https://{self.access_hostname}/papi/v1/properties/{property_id}/versions/{property_version}/rules'
        query = {
            'contractId': contract_id,
            'groupId': group_id
        }
        response = session.get(self.form_url(url), params = query)
        return response

    def get_access_key_versions(self, session, cam_key_id):
        url = f'https://{self.access_hostname}/cam/v1/access-keys/{cam_key_id}/versions'
        response = session.get(self.form_url(url))
        return response
    
    def form_url(self, url):
        # This is to ensure accountSwitchKey works for internal users
        if '?' in url:
            url = url + self.account_switch_key
        else:
            # Replace & with ? if there is no query string in URL
            account_switch_key = self.account_switch_key.translate(self.account_switch_key.maketrans('&', '?'))
            url = url + account_switch_key
        return url