{
  productId:: 'Fresca',
  ruleFormat:: 'v2025-01-13',
  rule: {
    name: error '<name> is required',
    comments: '',
    //comments: error "<comments> is required",

    behaviors: [],
    children: [],
    criteria: [],
    criteriaMustSatisfy: 'all',
    options: {},
  },
  root: {
    local _ = self,
    // The name of the default rule MUST BE "default", otherwise
    // PAPI throws occassional random errors.
    name: 'default',
    assert self.name == 'default',
    comments: |||
      The behaviors in the Default Rule apply to all requests for the property hostname(s) unless
      another rule overrides the Default Rule settings.
    |||,
    behaviors: [],
    children: [],
    options: {
      //is_secure: false,
    },
    variables: [
    ],
  },
  behaviors: {
    adaptiveAcceleration: {
      local _ = self,
      name: 'adaptiveAcceleration',

      source:: null,
      enablePush:: null,
      enablePreconnect:: null,
      preloadEnable:: null,
      abLogic:: null,
      cookieName:: null,
      intelligentEarlyHints:: null,
      enableRo:: null,
      enableBrotliCompression:: null,
      enableForNoncacheable:: null,

      options: {
        [name]: _[name]
        for name in ['source', 'enablePush', 'enablePreconnect', 'preloadEnable', 'abLogic', 'cookieName', 'intelligentEarlyHints', 'enableRo', 'enableBrotliCompression', 'enableForNoncacheable']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    adaptiveImageCompression: {
      local _ = self,
      name: 'adaptiveImageCompression',

      compressMobile:: null,
      tier1MobileCompressionMethod:: null,
      tier1MobileCompressionValue:: null,
      tier2MobileCompressionMethod:: null,
      tier2MobileCompressionValue:: null,
      tier3MobileCompressionMethod:: null,
      tier3MobileCompressionValue:: null,
      compressStandard:: null,
      tier1StandardCompressionMethod:: null,
      tier1StandardCompressionValue:: null,
      tier2StandardCompressionMethod:: null,
      tier2StandardCompressionValue:: null,
      tier3StandardCompressionMethod:: null,
      tier3StandardCompressionValue:: null,

      options: {
        [name]: _[name]
        for name in ['compressMobile', 'tier1MobileCompressionMethod', 'tier1MobileCompressionValue', 'tier2MobileCompressionMethod', 'tier2MobileCompressionValue', 'tier3MobileCompressionMethod', 'tier3MobileCompressionValue', 'compressStandard', 'tier1StandardCompressionMethod', 'tier1StandardCompressionValue', 'tier2StandardCompressionMethod', 'tier2StandardCompressionValue', 'tier3StandardCompressionMethod', 'tier3StandardCompressionValue']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    advanced: {
      local _ = self,
      name: 'advanced',

      description:: null,
      xml:: null,

      options: {
        [name]: _[name]
        for name in ['description', 'xml']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    akamaizer: {
      local _ = self,
      name: 'akamaizer',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    akamaizerTag: {
      local _ = self,
      name: 'akamaizerTag',

      matchHostname:: null,
      replacementHostname:: null,
      scope:: null,
      tagsAttribute:: null,
      replaceAll:: null,
      includeTagsAttribute:: null,

      options: {
        [name]: _[name]
        for name in ['matchHostname', 'replacementHostname', 'scope', 'tagsAttribute', 'replaceAll', 'includeTagsAttribute']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allHttpInCacheHierarchy: {
      local _ = self,
      name: 'allHttpInCacheHierarchy',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowCloudletsOrigins: {
      local _ = self,
      name: 'allowCloudletsOrigins',

      enabled:: null,
      honorBaseDirectory:: null,
      purgeOriginQueryParameter:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'honorBaseDirectory', 'purgeOriginQueryParameter']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowDelete: {
      local _ = self,
      name: 'allowDelete',

      enabled:: null,
      allowBody:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'allowBody']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowOptions: {
      local _ = self,
      name: 'allowOptions',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowPatch: {
      local _ = self,
      name: 'allowPatch',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowPost: {
      local _ = self,
      name: 'allowPost',

      enabled:: null,
      allowWithoutContentLength:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'allowWithoutContentLength']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowPut: {
      local _ = self,
      name: 'allowPut',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    allowTransferEncoding: {
      local _ = self,
      name: 'allowTransferEncoding',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    altSvcHeader: {
      local _ = self,
      name: 'altSvcHeader',

      maxAge:: null,

      options: {
        [name]: _[name]
        for name in ['maxAge']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    apiPrioritization: {
      local _ = self,
      name: 'apiPrioritization',

      enabled:: null,
      isSharedPolicy:: null,
      cloudletPolicy:: null,
      cloudletSharedPolicy:: null,
      label:: null,
      useThrottledCpCode:: null,
      throttledCpCode:: null,
      useThrottledStatusCode:: null,
      throttledStatusCode:: null,
      netStorage:: null,
      netStoragePath:: null,
      alternateResponseCacheTtl:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'isSharedPolicy', 'cloudletPolicy', 'cloudletSharedPolicy', 'label', 'useThrottledCpCode', 'throttledCpCode', 'useThrottledStatusCode', 'throttledStatusCode', 'netStorage', 'netStoragePath', 'alternateResponseCacheTtl']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    applicationLoadBalancer: {
      local _ = self,
      name: 'applicationLoadBalancer',

      enabled:: null,
      cloudletPolicy:: null,
      label:: null,
      stickinessCookieType:: null,
      stickinessExpirationDate:: null,
      stickinessDuration:: null,
      stickinessRefresh:: null,
      originCookieName:: null,
      specifyStickinessCookieDomain:: null,
      stickinessCookieDomain:: null,
      stickinessCookieAutomaticSalt:: null,
      stickinessCookieSalt:: null,
      stickinessCookieSetHttpOnlyFlag:: null,
      allDownNetStorage:: null,
      allDownNetStorageFile:: null,
      allDownStatusCode:: null,
      failoverStatusCodes:: null,
      failoverMode:: null,
      failoverOriginMap:: null,
      failoverAttemptsThreshold:: null,
      allowCachePrefresh:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy', 'label', 'stickinessCookieType', 'stickinessExpirationDate', 'stickinessDuration', 'stickinessRefresh', 'originCookieName', 'specifyStickinessCookieDomain', 'stickinessCookieDomain', 'stickinessCookieAutomaticSalt', 'stickinessCookieSalt', 'stickinessCookieSetHttpOnlyFlag', 'allDownNetStorage', 'allDownNetStorageFile', 'allDownStatusCode', 'failoverStatusCodes', 'failoverMode', 'failoverOriginMap', 'failoverAttemptsThreshold', 'allowCachePrefresh']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    audienceSegmentation: {
      local _ = self,
      name: 'audienceSegmentation',

      enabled:: null,
      isSharedPolicy:: null,
      cloudletPolicy:: null,
      cloudletSharedPolicy:: null,
      label:: null,
      segmentTrackingMethod:: null,
      segmentTrackingQueryParam:: null,
      segmentTrackingCookieName:: null,
      segmentTrackingCustomHeader:: null,
      populationCookieType:: null,
      populationDuration:: null,
      populationRefresh:: null,
      specifyPopulationCookieDomain:: null,
      populationCookieDomain:: null,
      populationCookieAutomaticSalt:: null,
      populationCookieSalt:: null,
      populationCookieIncludeRuleName:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'isSharedPolicy', 'cloudletPolicy', 'cloudletSharedPolicy', 'label', 'segmentTrackingMethod', 'segmentTrackingQueryParam', 'segmentTrackingCookieName', 'segmentTrackingCustomHeader', 'populationCookieType', 'populationDuration', 'populationRefresh', 'specifyPopulationCookieDomain', 'populationCookieDomain', 'populationCookieAutomaticSalt', 'populationCookieSalt', 'populationCookieIncludeRuleName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    autoDomainValidation: {
      local _ = self,
      name: 'autoDomainValidation',


      options: {
        [name]: _[name]
        for name in []
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    baseDirectory: {
      local _ = self,
      name: 'baseDirectory',

      value:: null,

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    breadcrumbs: {
      local _ = self,
      name: 'breadcrumbs',

      enabled:: null,
      optMode:: null,
      loggingEnabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'optMode', 'loggingEnabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    breakConnection: {
      local _ = self,
      name: 'breakConnection',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    brotli: {
      local _ = self,
      name: 'brotli',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheError: {
      local _ = self,
      name: 'cacheError',

      enabled:: null,
      ttl:: null,
      preserveStale:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'ttl', 'preserveStale']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheId: {
      local _ = self,
      name: 'cacheId',

      rule:: null,
      includeValue:: null,
      optional:: null,
      elements:: null,
      variableName:: null,

      options: {
        [name]: _[name]
        for name in ['rule', 'includeValue', 'optional', 'elements', 'variableName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheKeyIgnoreCase: {
      local _ = self,
      name: 'cacheKeyIgnoreCase',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheKeyQueryParams: {
      local _ = self,
      name: 'cacheKeyQueryParams',

      behavior:: null,
      parameters:: null,
      exactMatch:: null,

      options: {
        [name]: _[name]
        for name in ['behavior', 'parameters', 'exactMatch']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cachePost: {
      local _ = self,
      name: 'cachePost',

      enabled:: null,
      useBody:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'useBody']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheRedirect: {
      local _ = self,
      name: 'cacheRedirect',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheTag: {
      local _ = self,
      name: 'cacheTag',

      tag:: null,

      options: {
        [name]: _[name]
        for name in ['tag']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheTagVisible: {
      local _ = self,
      name: 'cacheTagVisible',

      behavior:: null,

      options: {
        [name]: _[name]
        for name in ['behavior']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    caching: {
      local _ = self,
      name: 'caching',

      behavior:: null,
      mustRevalidate:: null,
      ttl:: null,
      defaultTtl:: null,
      enhancedRfcSupport:: null,
      honorNoStore:: null,
      honorPrivate:: null,
      honorNoCache:: null,
      honorMaxAge:: null,
      honorSMaxage:: null,
      honorMustRevalidate:: null,
      honorProxyRevalidate:: null,

      options: {
        [name]: _[name]
        for name in ['behavior', 'mustRevalidate', 'ttl', 'defaultTtl', 'enhancedRfcSupport', 'honorNoStore', 'honorPrivate', 'honorNoCache', 'honorMaxAge', 'honorSMaxage', 'honorMustRevalidate', 'honorProxyRevalidate']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    centralAuthorization: {
      local _ = self,
      name: 'centralAuthorization',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    chaseRedirects: {
      local _ = self,
      name: 'chaseRedirects',

      enabled:: null,
      limit:: null,
      serve404:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'limit', 'serve404']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    clientCertificateAuth: {
      local _ = self,
      name: 'clientCertificateAuth',

      enable:: null,
      enableCompleteClientCertificate:: null,
      clientCertificateAttributes:: null,
      enableClientCertificateValidationStatus:: null,

      options: {
        [name]: _[name]
        for name in ['enable', 'enableCompleteClientCertificate', 'clientCertificateAttributes', 'enableClientCertificateValidationStatus']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cloudInterconnects: {
      local _ = self,
      name: 'cloudInterconnects',

      enabled:: null,
      cloudLocations:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudLocations']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cloudWrapper: {
      local _ = self,
      name: 'cloudWrapper',

      enabled:: null,
      location:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'location']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cloudWrapperAdvanced: {
      local _ = self,
      name: 'cloudWrapperAdvanced',

      enabled:: null,
      failoverMap:: null,
      customFailoverMap:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'failoverMap', 'customFailoverMap']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    conditionalOrigin: {
      local _ = self,
      name: 'conditionalOrigin',

      originId:: null,

      options: {
        [name]: _[name]
        for name in ['originId']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    constructResponse: {
      local _ = self,
      name: 'constructResponse',

      enabled:: null,
      body:: null,
      responseCode:: null,
      forceEviction:: null,
      ignorePurge:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'body', 'responseCode', 'forceEviction', 'ignorePurge']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    corsSupport: {
      local _ = self,
      name: 'corsSupport',

      enabled:: null,
      allowOrigins:: null,
      origins:: null,
      allowCredentials:: null,
      allowHeaders:: null,
      headers:: null,
      methods:: null,
      exposeHeaders:: null,
      preflightMaxAge:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'allowOrigins', 'origins', 'allowCredentials', 'allowHeaders', 'headers', 'methods', 'exposeHeaders', 'preflightMaxAge']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cpCode: {
      local _ = self,
      name: 'cpCode',

      value:: null,

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    customBehavior: {
      local _ = self,
      name: 'customBehavior',

      behaviorId:: null,

      options: {
        [name]: _[name]
        for name in ['behaviorId']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    datastream: {
      local _ = self,
      name: 'datastream',

      streamType:: null,
      enabled:: null,
      datastreamIds:: null,
      logEnabled:: null,
      logStreamName:: null,
      samplingPercentage:: null,
      collectMidgressTraffic:: null,

      options: {
        [name]: _[name]
        for name in ['streamType', 'enabled', 'datastreamIds', 'logEnabled', 'logStreamName', 'samplingPercentage', 'collectMidgressTraffic']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    denyAccess: {
      local _ = self,
      name: 'denyAccess',

      reason:: null,
      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['reason', 'enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    deviceCharacteristicCacheId: {
      local _ = self,
      name: 'deviceCharacteristicCacheId',

      elements:: null,

      options: {
        [name]: _[name]
        for name in ['elements']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    deviceCharacteristicHeader: {
      local _ = self,
      name: 'deviceCharacteristicHeader',

      elements:: null,

      options: {
        [name]: _[name]
        for name in ['elements']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    dnsAsyncRefresh: {
      local _ = self,
      name: 'dnsAsyncRefresh',

      enabled:: null,
      timeout:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'timeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    dnsPrefresh: {
      local _ = self,
      name: 'dnsPrefresh',

      enabled:: null,
      delay:: null,
      timeout:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'delay', 'timeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    downstreamCache: {
      local _ = self,
      name: 'downstreamCache',

      behavior:: null,
      allowBehavior:: null,
      ttl:: null,
      sendHeaders:: null,
      sendPrivate:: null,

      options: {
        [name]: _[name]
        for name in ['behavior', 'allowBehavior', 'ttl', 'sendHeaders', 'sendPrivate']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    earlyData: {
      local _ = self,
      name: 'earlyData',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    earlyHints: {
      local _ = self,
      name: 'earlyHints',

      enabled:: null,
      resourceUrl:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'resourceUrl']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeConnect: {
      local _ = self,
      name: 'edgeConnect',

      enabled:: null,
      apiConnector:: null,
      apiDataElements:: null,
      destinationHostname:: null,
      destinationPath:: null,
      overrideAggregateSettings:: null,
      aggregateTime:: null,
      aggregateLines:: null,
      aggregateSize:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'apiConnector', 'apiDataElements', 'destinationHostname', 'destinationPath', 'overrideAggregateSettings', 'aggregateTime', 'aggregateLines', 'aggregateSize']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeLoadBalancingAdvanced: {
      local _ = self,
      name: 'edgeLoadBalancingAdvanced',

      description:: null,
      xml:: null,

      options: {
        [name]: _[name]
        for name in ['description', 'xml']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeLoadBalancingDataCenter: {
      local _ = self,
      name: 'edgeLoadBalancingDataCenter',

      originId:: null,
      description:: null,
      hostname:: null,
      cookieName:: null,
      enableFailover:: null,
      ip:: null,
      failoverRules:: null,

      options: {
        [name]: _[name]
        for name in ['originId', 'description', 'hostname', 'cookieName', 'enableFailover', 'ip', 'failoverRules']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeLoadBalancingOrigin: {
      local _ = self,
      name: 'edgeLoadBalancingOrigin',

      id:: null,
      description:: null,
      hostname:: null,
      enableSessionPersistence:: null,
      cookieName:: null,

      options: {
        [name]: _[name]
        for name in ['id', 'description', 'hostname', 'enableSessionPersistence', 'cookieName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeOriginAuthorization: {
      local _ = self,
      name: 'edgeOriginAuthorization',

      enabled:: null,
      cookieName:: null,
      value:: null,
      domain:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cookieName', 'value', 'domain']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeRedirector: {
      local _ = self,
      name: 'edgeRedirector',

      enabled:: null,
      isSharedPolicy:: null,
      cloudletPolicy:: null,
      cloudletSharedPolicy:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'isSharedPolicy', 'cloudletPolicy', 'cloudletSharedPolicy']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeScape: {
      local _ = self,
      name: 'edgeScape',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeSideIncludes: {
      local _ = self,
      name: 'edgeSideIncludes',

      enabled:: null,
      enableViaHttp:: null,
      passSetCookie:: null,
      passClientIp:: null,
      i18nStatus:: null,
      i18nCharset:: null,
      detectInjection:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'enableViaHttp', 'passSetCookie', 'passClientIp', 'i18nStatus', 'i18nCharset', 'detectInjection']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeWorker: {
      local _ = self,
      name: 'edgeWorker',

      enabled:: null,
      edgeWorkerId:: null,
      mPulse:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'edgeWorkerId', 'mPulse']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    enforceMtlsSettings: {
      local _ = self,
      name: 'enforceMtlsSettings',

      enableAuthSet:: null,
      certificateAuthoritySet:: null,
      enableOcspStatus:: null,
      enableDenyRequest:: null,

      options: {
        [name]: _[name]
        for name in ['enableAuthSet', 'certificateAuthoritySet', 'enableOcspStatus', 'enableDenyRequest']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    enhancedAkamaiProtocol: {
      local _ = self,
      name: 'enhancedAkamaiProtocol',


      options: {
        [name]: _[name]
        for name in []
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    enhancedDebug: {
      local _ = self,
      name: 'enhancedDebug',

      enableDebug:: null,
      debugKey:: null,
      disablePragma:: null,
      generateGrn:: null,

      options: {
        [name]: _[name]
        for name in ['enableDebug', 'debugKey', 'disablePragma', 'generateGrn']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    enhancedProxyDetection: {
      local _ = self,
      name: 'enhancedProxyDetection',

      enabled:: null,
      forwardHeaderEnrichment:: null,
      enableConfigurationMode:: null,
      bestPracticeAction:: null,
      bestPracticeRedirecturl:: null,
      detectAnonymousVpn:: null,
      detectAnonymousVpnAction:: null,
      detectAnonymousVpnRedirecturl:: null,
      detectPublicProxy:: null,
      detectPublicProxyAction:: null,
      detectPublicProxyRedirecturl:: null,
      detectTorExitNode:: null,
      detectTorExitNodeAction:: null,
      detectTorExitNodeRedirecturl:: null,
      detectSmartDNSProxy:: null,
      detectSmartDNSProxyAction:: null,
      detectSmartDNSProxyRedirecturl:: null,
      detectHostingProvider:: null,
      detectHostingProviderAction:: null,
      detectHostingProviderRedirecturl:: null,
      detectVpnDataCenter:: null,
      detectVpnDataCenterAction:: null,
      detectVpnDataCenterRedirecturl:: null,
      detectResidentialProxy:: null,
      detectResidentialProxyAction:: null,
      detectResidentialProxyRedirecturl:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'forwardHeaderEnrichment', 'enableConfigurationMode', 'bestPracticeAction', 'bestPracticeRedirecturl', 'detectAnonymousVpn', 'detectAnonymousVpnAction', 'detectAnonymousVpnRedirecturl', 'detectPublicProxy', 'detectPublicProxyAction', 'detectPublicProxyRedirecturl', 'detectTorExitNode', 'detectTorExitNodeAction', 'detectTorExitNodeRedirecturl', 'detectSmartDNSProxy', 'detectSmartDNSProxyAction', 'detectSmartDNSProxyRedirecturl', 'detectHostingProvider', 'detectHostingProviderAction', 'detectHostingProviderRedirecturl', 'detectVpnDataCenter', 'detectVpnDataCenterAction', 'detectVpnDataCenterRedirecturl', 'detectResidentialProxy', 'detectResidentialProxyAction', 'detectResidentialProxyRedirecturl']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    epdForwardHeaderEnrichment: {
      local _ = self,
      name: 'epdForwardHeaderEnrichment',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    failAction: {
      local _ = self,
      name: 'failAction',

      enabled:: null,
      actionType:: null,
      saasType:: null,
      saasCnameEnabled:: null,
      saasCnameLevel:: null,
      saasCookie:: null,
      saasQueryString:: null,
      saasRegex:: null,
      saasReplace:: null,
      saasSuffix:: null,
      dynamicMethod:: null,
      dynamicCustomPath:: null,
      dynamicPath:: null,
      redirectHostnameType:: null,
      redirectHostname:: null,
      redirectCustomPath:: null,
      redirectPath:: null,
      redirectMethod:: null,
      contentHostname:: null,
      contentCustomPath:: null,
      contentPath:: null,
      netStorageHostname:: null,
      netStoragePath:: null,
      cexHostname:: null,
      cexCustomPath:: null,
      cexPath:: null,
      cpCode:: null,
      statusCode:: null,
      preserveQueryString:: null,
      modifyProtocol:: null,
      protocol:: null,
      allowFCMParentOverride:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'actionType', 'saasType', 'saasCnameEnabled', 'saasCnameLevel', 'saasCookie', 'saasQueryString', 'saasRegex', 'saasReplace', 'saasSuffix', 'dynamicMethod', 'dynamicCustomPath', 'dynamicPath', 'redirectHostnameType', 'redirectHostname', 'redirectCustomPath', 'redirectPath', 'redirectMethod', 'contentHostname', 'contentCustomPath', 'contentPath', 'netStorageHostname', 'netStoragePath', 'cexHostname', 'cexCustomPath', 'cexPath', 'cpCode', 'statusCode', 'preserveQueryString', 'modifyProtocol', 'protocol', 'allowFCMParentOverride']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    failoverBotManagerFeatureCompatibility: {
      local _ = self,
      name: 'failoverBotManagerFeatureCompatibility',

      compatibility:: null,

      options: {
        [name]: _[name]
        for name in ['compatibility']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    fastInvalidate: {
      local _ = self,
      name: 'fastInvalidate',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    fips: {
      local _ = self,
      name: 'fips',

      enable:: null,

      options: {
        [name]: _[name]
        for name in ['enable']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    firstPartyMarketing: {
      local _ = self,
      name: 'firstPartyMarketing',

      enabled:: null,
      javaScriptInsertionRule:: null,
      cloudletPolicy:: null,
      mediaMathPrefix:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'javaScriptInsertionRule', 'cloudletPolicy', 'mediaMathPrefix']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    firstPartyMarketingPlus: {
      local _ = self,
      name: 'firstPartyMarketingPlus',

      enabled:: null,
      javaScriptInsertionRule:: null,
      cloudletPolicy:: null,
      mediaMathPrefix:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'javaScriptInsertionRule', 'cloudletPolicy', 'mediaMathPrefix']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    forwardRewrite: {
      local _ = self,
      name: 'forwardRewrite',

      enabled:: null,
      isSharedPolicy:: null,
      cloudletPolicy:: null,
      cloudletSharedPolicy:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'isSharedPolicy', 'cloudletPolicy', 'cloudletSharedPolicy']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    globalRequestNumber: {
      local _ = self,
      name: 'globalRequestNumber',

      outputOption:: null,
      headerName:: null,
      variableName:: null,

      options: {
        [name]: _[name]
        for name in ['outputOption', 'headerName', 'variableName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    govCloud: {
      local _ = self,
      name: 'govCloud',


      options: {
        [name]: _[name]
        for name in []
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    graphqlCaching: {
      local _ = self,
      name: 'graphqlCaching',

      enabled:: null,
      cacheResponsesWithErrors:: null,
      postRequestProcessingErrorHandling:: null,
      operationsUrlQueryParameterName:: null,
      operationsJsonBodyParameterName:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cacheResponsesWithErrors', 'postRequestProcessingErrorHandling', 'operationsUrlQueryParameterName', 'operationsJsonBodyParameterName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    gzipResponse: {
      local _ = self,
      name: 'gzipResponse',

      behavior:: null,

      options: {
        [name]: _[name]
        for name in ['behavior']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    healthDetection: {
      local _ = self,
      name: 'healthDetection',

      retryCount:: null,
      retryInterval:: null,
      maximumReconnects:: null,

      options: {
        [name]: _[name]
        for name in ['retryCount', 'retryInterval', 'maximumReconnects']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    hsafEipBinding: {
      local _ = self,
      name: 'hsafEipBinding',

      enabled:: null,
      customExtractedSerial:: null,
      hashMinValue:: null,
      hashMaxValue:: null,
      tier:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'customExtractedSerial', 'hashMinValue', 'hashMaxValue', 'tier']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    http2: {
      local _ = self,
      name: 'http2',


      options: {
        [name]: _[name]
        for name in []
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    http3: {
      local _ = self,
      name: 'http3',

      enable:: null,

      options: {
        [name]: _[name]
        for name in ['enable']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    httpStrictTransportSecurity: {
      local _ = self,
      name: 'httpStrictTransportSecurity',

      enable:: null,
      maxAge:: null,
      includeSubDomains:: null,
      preload:: null,
      redirect:: null,
      redirectStatusCode:: null,

      options: {
        [name]: _[name]
        for name in ['enable', 'maxAge', 'includeSubDomains', 'preload', 'redirect', 'redirectStatusCode']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    imOverride: {
      local _ = self,
      name: 'imOverride',

      override:: null,
      typesel:: null,
      formatvar:: null,
      format:: null,
      dprvar:: null,
      dpr:: null,
      widthvar:: null,
      width:: null,
      policyvar:: null,
      policy:: null,
      policyvarName:: null,
      policyvarIMvar:: null,
      excludeAllQueryParameters:: null,
      excludedQueryParameters:: null,

      options: {
        [name]: _[name]
        for name in ['override', 'typesel', 'formatvar', 'format', 'dprvar', 'dpr', 'widthvar', 'width', 'policyvar', 'policy', 'policyvarName', 'policyvarIMvar', 'excludeAllQueryParameters', 'excludedQueryParameters']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    imageAndVideoManager: {
      local _ = self,
      name: 'imageAndVideoManager',

      policySetType:: null,
      enabled:: null,
      resize:: null,
      applyBestFileType:: null,
      cpCodeOriginal:: null,
      cpCodeTransformed:: null,
      imageSet:: null,
      videoSet:: null,

      options: {
        [name]: _[name]
        for name in ['policySetType', 'enabled', 'resize', 'applyBestFileType', 'cpCodeOriginal', 'cpCodeTransformed', 'imageSet', 'videoSet']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    imageManager: {
      local _ = self,
      name: 'imageManager',

      enabled:: null,
      resize:: null,
      applyBestFileType:: null,
      superCacheRegion:: null,
      cpCodeOriginal:: null,
      cpCodeTransformed:: null,
      useExistingPolicySet:: null,
      policySet:: null,
      advanced:: null,
      policyToken:: null,
      policyTokenDefault:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'resize', 'applyBestFileType', 'superCacheRegion', 'cpCodeOriginal', 'cpCodeTransformed', 'useExistingPolicySet', 'policySet', 'advanced', 'policyToken', 'policyTokenDefault']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    imageManagerVideo: {
      local _ = self,
      name: 'imageManagerVideo',

      enabled:: null,
      resize:: null,
      applyBestFileType:: null,
      superCacheRegion:: null,
      cpCodeOriginal:: null,
      cpCodeTransformed:: null,
      useExistingPolicySet:: null,
      policySet:: null,
      advanced:: null,
      policyToken:: null,
      policyTokenDefault:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'resize', 'applyBestFileType', 'superCacheRegion', 'cpCodeOriginal', 'cpCodeTransformed', 'useExistingPolicySet', 'policySet', 'advanced', 'policyToken', 'policyTokenDefault']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    include: {
      local _ = self,
      name: 'include',

      id:: null,

      options: {
        [name]: _[name]
        for name in ['id']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    instantConfig: {
      local _ = self,
      name: 'instantConfig',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    largeFileOptimization: {
      local _ = self,
      name: 'largeFileOptimization',

      enabled:: null,
      enablePartialObjectCaching:: null,
      minimumSize:: null,
      maximumSize:: null,
      useVersioning:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'enablePartialObjectCaching', 'minimumSize', 'maximumSize', 'useVersioning']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    logCustom: {
      local _ = self,
      name: 'logCustom',

      logCustomLogField:: null,
      customLogField:: null,

      options: {
        [name]: _[name]
        for name in ['logCustomLogField', 'customLogField']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    mPulse: {
      local _ = self,
      name: 'mPulse',

      enabled:: null,
      requirePci:: null,
      loaderVersion:: null,
      apiKey:: null,
      bufferSize:: null,
      configOverride:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'requirePci', 'loaderVersion', 'apiKey', 'bufferSize', 'configOverride']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    manualServerPush: {
      local _ = self,
      name: 'manualServerPush',

      serverpushlist:: null,

      options: {
        [name]: _[name]
        for name in ['serverpushlist']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    mobileSdkPerformance: {
      local _ = self,
      name: 'mobileSdkPerformance',

      enabled:: null,
      secondaryMultipathToOrigin:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'secondaryMultipathToOrigin']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    modifyIncomingRequestHeader: {
      local _ = self,
      name: 'modifyIncomingRequestHeader',

      action:: null,
      standardAddHeaderName:: null,
      standardDeleteHeaderName:: null,
      standardModifyHeaderName:: null,
      standardPassHeaderName:: null,
      customHeaderName:: null,
      headerValue:: null,
      newHeaderValue:: null,
      avoidDuplicateHeaders:: null,

      options: {
        [name]: _[name]
        for name in ['action', 'standardAddHeaderName', 'standardDeleteHeaderName', 'standardModifyHeaderName', 'standardPassHeaderName', 'customHeaderName', 'headerValue', 'newHeaderValue', 'avoidDuplicateHeaders']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    modifyIncomingResponseHeader: {
      local _ = self,
      name: 'modifyIncomingResponseHeader',

      action:: null,
      standardAddHeaderName:: null,
      standardDeleteHeaderName:: null,
      standardModifyHeaderName:: null,
      standardPassHeaderName:: null,
      customHeaderName:: null,
      headerValue:: null,
      newHeaderValue:: null,
      avoidDuplicateHeaders:: null,

      options: {
        [name]: _[name]
        for name in ['action', 'standardAddHeaderName', 'standardDeleteHeaderName', 'standardModifyHeaderName', 'standardPassHeaderName', 'customHeaderName', 'headerValue', 'newHeaderValue', 'avoidDuplicateHeaders']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    modifyOutgoingRequestHeader: {
      local _ = self,
      name: 'modifyOutgoingRequestHeader',

      action:: null,
      standardAddHeaderName:: null,
      standardDeleteHeaderName:: null,
      standardModifyHeaderName:: null,
      customHeaderName:: null,
      headerValue:: null,
      newHeaderValue:: null,
      regexHeaderMatch:: null,
      regexHeaderReplace:: null,
      matchMultiple:: null,
      avoidDuplicateHeaders:: null,

      options: {
        [name]: _[name]
        for name in ['action', 'standardAddHeaderName', 'standardDeleteHeaderName', 'standardModifyHeaderName', 'customHeaderName', 'headerValue', 'newHeaderValue', 'regexHeaderMatch', 'regexHeaderReplace', 'matchMultiple', 'avoidDuplicateHeaders']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    modifyOutgoingResponseHeader: {
      local _ = self,
      name: 'modifyOutgoingResponseHeader',

      action:: null,
      standardAddHeaderName:: null,
      standardDeleteHeaderName:: null,
      standardModifyHeaderName:: null,
      customHeaderName:: null,
      headerValue:: null,
      newHeaderValue:: null,
      regexHeaderMatch:: null,
      regexHeaderReplace:: null,
      matchMultiple:: null,
      avoidDuplicateHeaders:: null,

      options: {
        [name]: _[name]
        for name in ['action', 'standardAddHeaderName', 'standardDeleteHeaderName', 'standardModifyHeaderName', 'customHeaderName', 'headerValue', 'newHeaderValue', 'regexHeaderMatch', 'regexHeaderReplace', 'matchMultiple', 'avoidDuplicateHeaders']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    modifyViaHeader: {
      local _ = self,
      name: 'modifyViaHeader',

      enabled:: null,
      modificationOption:: null,
      renameHeaderTo:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'modificationOption', 'renameHeaderTo']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    mtlsOriginKeystore: {
      local _ = self,
      name: 'mtlsOriginKeystore',

      enable:: null,
      clientCertificateVersionGuid:: null,
      authClientCert:: null,

      options: {
        [name]: _[name]
        for name in ['enable', 'clientCertificateVersionGuid', 'authClientCert']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    origin: {
      local _ = self,
      name: 'origin',

      originType:: null,
      netStorage:: null,
      originId:: null,
      hostname:: null,
      secondHostnameEnabled:: null,
      secondHostname:: null,
      mslorigin:: null,
      saasType:: null,
      saasCnameEnabled:: null,
      saasCnameLevel:: null,
      saasCookie:: null,
      saasQueryString:: null,
      saasRegex:: null,
      saasReplace:: null,
      saasSuffix:: null,
      forwardHostHeader:: null,
      customForwardHostHeader:: null,
      cacheKeyHostname:: null,
      ipVersion:: null,
      useUniqueCacheKey:: null,
      compress:: null,
      enableTrueClientIp:: null,
      trueClientIpHeader:: null,
      trueClientIpClientSetting:: null,
      verificationMode:: null,
      originSni:: null,
      customValidCnValues:: null,
      originCertsToHonor:: null,
      standardCertificateAuthorities:: null,
      customCertificateAuthorities:: null,
      customCertificates:: null,
      httpPort:: null,
      httpsPort:: null,
      minTlsVersion:: null,
      maxTlsVersion:: null,
      http2Enabled:: null,

      options: {
        [name]: _[name]
        for name in ['originType', 'netStorage', 'originId', 'hostname', 'secondHostnameEnabled', 'secondHostname', 'mslorigin', 'saasType', 'saasCnameEnabled', 'saasCnameLevel', 'saasCookie', 'saasQueryString', 'saasRegex', 'saasReplace', 'saasSuffix', 'forwardHostHeader', 'customForwardHostHeader', 'cacheKeyHostname', 'ipVersion', 'useUniqueCacheKey', 'compress', 'enableTrueClientIp', 'trueClientIpHeader', 'trueClientIpClientSetting', 'verificationMode', 'originSni', 'customValidCnValues', 'originCertsToHonor', 'standardCertificateAuthorities', 'customCertificateAuthorities', 'customCertificates', 'httpPort', 'httpsPort', 'minTlsVersion', 'maxTlsVersion', 'http2Enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    originCharacteristics: {
      local _ = self,
      name: 'originCharacteristics',

      authenticationMethod:: null,
      encodingVersion:: null,
      useCustomSignString:: null,
      customSignString:: null,
      secretKey:: null,
      nonce:: null,
      mslkey:: null,
      mslname:: null,
      accessKeyEncryptedStorage:: null,
      gcsAccessKeyVersionGuid:: null,
      gcsHmacKeyAccessId:: null,
      gcsHmacKeySecret:: null,
      awsAccessKeyVersionGuid:: null,
      awsAccessKeyId:: null,
      awsSecretAccessKey:: null,
      awsRegion:: null,
      awsHost:: null,
      awsService:: null,
      propertyIdTag:: null,
      hostnameTag:: null,
      roleArn:: null,
      awsArRegion:: null,
      endPointService:: null,
      sortQueryParams:: null,
      encodeQueryParams:: null,
      encodeEquals:: null,
      country:: null,
      directConnectGeo:: null,

      options: {
        [name]: _[name]
        for name in ['authenticationMethod', 'encodingVersion', 'useCustomSignString', 'customSignString', 'secretKey', 'nonce', 'mslkey', 'mslname', 'accessKeyEncryptedStorage', 'gcsAccessKeyVersionGuid', 'gcsHmacKeyAccessId', 'gcsHmacKeySecret', 'awsAccessKeyVersionGuid', 'awsAccessKeyId', 'awsSecretAccessKey', 'awsRegion', 'awsHost', 'awsService', 'propertyIdTag', 'hostnameTag', 'roleArn', 'awsArRegion', 'endPointService', 'sortQueryParams', 'encodeQueryParams', 'encodeEquals', 'country', 'directConnectGeo']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    originIpAcl: {
      local _ = self,
      name: 'originIpAcl',

      enable:: null,

      options: {
        [name]: _[name]
        for name in ['enable']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    permissionsPolicy: {
      local _ = self,
      name: 'permissionsPolicy',

      permissionsPolicyDirective:: null,
      allowList:: null,

      options: {
        [name]: _[name]
        for name in ['permissionsPolicyDirective', 'allowList']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    persistentClientConnection: {
      local _ = self,
      name: 'persistentClientConnection',

      enabled:: null,
      timeout:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'timeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    persistentConnection: {
      local _ = self,
      name: 'persistentConnection',

      enabled:: null,
      timeout:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'timeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    personallyIdentifiableInformation: {
      local _ = self,
      name: 'personallyIdentifiableInformation',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    phasedRelease: {
      local _ = self,
      name: 'phasedRelease',

      enabled:: null,
      isSharedPolicy:: null,
      cloudletPolicy:: null,
      cloudletSharedPolicy:: null,
      label:: null,
      populationCookieType:: null,
      populationExpirationDate:: null,
      populationDuration:: null,
      populationRefresh:: null,
      failoverEnabled:: null,
      failoverResponseCode:: null,
      failoverDuration:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'isSharedPolicy', 'cloudletPolicy', 'cloudletSharedPolicy', 'label', 'populationCookieType', 'populationExpirationDate', 'populationDuration', 'populationRefresh', 'failoverEnabled', 'failoverResponseCode', 'failoverDuration']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    preconnect: {
      local _ = self,
      name: 'preconnect',

      preconnectlist:: null,

      options: {
        [name]: _[name]
        for name in ['preconnectlist']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    prefetch: {
      local _ = self,
      name: 'prefetch',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    prefetchable: {
      local _ = self,
      name: 'prefetchable',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    prefreshCache: {
      local _ = self,
      name: 'prefreshCache',

      enabled:: null,
      prefreshval:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'prefreshval']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    quicBeta: {
      local _ = self,
      name: 'quicBeta',

      enabled:: null,
      quicOfferPercentage:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'quicOfferPercentage']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    rapid: {
      local _ = self,
      name: 'rapid',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    readTimeout: {
      local _ = self,
      name: 'readTimeout',

      value:: null,
      firstByteTimeout:: null,

      options: {
        [name]: _[name]
        for name in ['value', 'firstByteTimeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    realUserMonitoring: {
      local _ = self,
      name: 'realUserMonitoring',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    redirect: {
      local _ = self,
      name: 'redirect',

      mobileDefaultChoice:: null,
      destinationProtocol:: null,
      destinationHostname:: null,
      destinationHostnameSubdomain:: null,
      destinationHostnameSibling:: null,
      destinationHostnameOther:: null,
      destinationPath:: null,
      destinationPathPrefix:: null,
      destinationPathSuffixStatus:: null,
      destinationPathSuffix:: null,
      destinationPathOther:: null,
      queryString:: null,
      responseCode:: null,

      options: {
        [name]: _[name]
        for name in ['mobileDefaultChoice', 'destinationProtocol', 'destinationHostname', 'destinationHostnameSubdomain', 'destinationHostnameSibling', 'destinationHostnameOther', 'destinationPath', 'destinationPathPrefix', 'destinationPathSuffixStatus', 'destinationPathSuffix', 'destinationPathOther', 'queryString', 'responseCode']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    redirectplus: {
      local _ = self,
      name: 'redirectplus',

      enabled:: null,
      destination:: null,
      responseCode:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'destination', 'responseCode']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    refererChecking: {
      local _ = self,
      name: 'refererChecking',

      enabled:: null,
      strict:: null,
      domains:: null,
      allowChildren:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'strict', 'domains', 'allowChildren']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    removeQueryParameter: {
      local _ = self,
      name: 'removeQueryParameter',

      parameters:: null,

      options: {
        [name]: _[name]
        for name in ['parameters']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    removeVary: {
      local _ = self,
      name: 'removeVary',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    report: {
      local _ = self,
      name: 'report',

      logHost:: null,
      logReferer:: null,
      logUserAgent:: null,
      logAcceptLanguage:: null,
      logCookies:: null,
      cookies:: null,
      logCustomLogField:: null,
      customLogField:: null,
      logEdgeIP:: null,
      logXForwardedFor:: null,

      options: {
        [name]: _[name]
        for name in ['logHost', 'logReferer', 'logUserAgent', 'logAcceptLanguage', 'logCookies', 'cookies', 'logCustomLogField', 'customLogField', 'logEdgeIP', 'logXForwardedFor']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestClientHints: {
      local _ = self,
      name: 'requestClientHints',

      acceptCh:: null,
      acceptCriticalCh:: null,
      reset:: null,

      options: {
        [name]: _[name]
        for name in ['acceptCh', 'acceptCriticalCh', 'reset']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestControl: {
      local _ = self,
      name: 'requestControl',

      enabled:: null,
      isSharedPolicy:: null,
      cloudletPolicy:: null,
      cloudletSharedPolicy:: null,
      enableBranded403:: null,
      branded403StatusCode:: null,
      netStorage:: null,
      branded403File:: null,
      branded403Url:: null,
      brandedDenyCacheTtl:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'isSharedPolicy', 'cloudletPolicy', 'cloudletSharedPolicy', 'enableBranded403', 'branded403StatusCode', 'netStorage', 'branded403File', 'branded403Url', 'brandedDenyCacheTtl']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    resourceOptimizer: {
      local _ = self,
      name: 'resourceOptimizer',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    resourceOptimizerExtendedCompatibility: {
      local _ = self,
      name: 'resourceOptimizerExtendedCompatibility',

      enabled:: null,
      enableAllFeatures:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'enableAllFeatures']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    responseCode: {
      local _ = self,
      name: 'responseCode',

      statusCode:: null,
      override206:: null,

      options: {
        [name]: _[name]
        for name in ['statusCode', 'override206']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    responseCookie: {
      local _ = self,
      name: 'responseCookie',

      cookieName:: null,
      enabled:: null,
      type:: null,
      value:: null,
      format:: null,
      defaultDomain:: null,
      defaultPath:: null,
      domain:: null,
      path:: null,
      expires:: null,
      expirationDate:: null,
      duration:: null,
      sameSite:: null,
      secure:: null,
      httpOnly:: null,

      options: {
        [name]: _[name]
        for name in ['cookieName', 'enabled', 'type', 'value', 'format', 'defaultDomain', 'defaultPath', 'domain', 'path', 'expires', 'expirationDate', 'duration', 'sameSite', 'secure', 'httpOnly']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    returnCacheStatus: {
      local _ = self,
      name: 'returnCacheStatus',

      responseHeaderName:: null,

      options: {
        [name]: _[name]
        for name in ['responseHeaderName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    rewriteUrl: {
      local _ = self,
      name: 'rewriteUrl',

      behavior:: null,
      match:: null,
      matchRegex:: null,
      targetRegex:: null,
      targetPath:: null,
      targetPathPrepend:: null,
      targetUrl:: null,
      matchMultiple:: null,
      keepQueryString:: null,

      options: {
        [name]: _[name]
        for name in ['behavior', 'match', 'matchRegex', 'targetRegex', 'targetPath', 'targetPathPrepend', 'targetUrl', 'matchMultiple', 'keepQueryString']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    rumCustom: {
      local _ = self,
      name: 'rumCustom',

      rumSampleRate:: null,
      rumGroupName:: null,

      options: {
        [name]: _[name]
        for name in ['rumSampleRate', 'rumGroupName']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    saasDefinitions: {
      local _ = self,
      name: 'saasDefinitions',

      customerAction:: null,
      customerCnameEnabled:: null,
      customerCnameLevel:: null,
      customerCookie:: null,
      customerQueryString:: null,
      customerRegex:: null,
      customerReplace:: null,
      applicationAction:: null,
      applicationCnameEnabled:: null,
      applicationCnameLevel:: null,
      applicationCookie:: null,
      applicationQueryString:: null,
      applicationRegex:: null,
      applicationReplace:: null,
      usersAction:: null,
      usersCnameEnabled:: null,
      usersCnameLevel:: null,
      usersCookie:: null,
      usersQueryString:: null,
      usersRegex:: null,
      usersReplace:: null,

      options: {
        [name]: _[name]
        for name in ['customerAction', 'customerCnameEnabled', 'customerCnameLevel', 'customerCookie', 'customerQueryString', 'customerRegex', 'customerReplace', 'applicationAction', 'applicationCnameEnabled', 'applicationCnameLevel', 'applicationCookie', 'applicationQueryString', 'applicationRegex', 'applicationReplace', 'usersAction', 'usersCnameEnabled', 'usersCnameLevel', 'usersCookie', 'usersQueryString', 'usersRegex', 'usersReplace']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    salesForceCommerceCloudClient: {
      local _ = self,
      name: 'salesForceCommerceCloudClient',

      enabled:: null,
      connectorId:: null,
      originType:: null,
      sf3cOriginHost:: null,
      originHostHeader:: null,
      sf3cOriginHostHeader:: null,
      allowOverrideOriginCacheKey:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'connectorId', 'originType', 'sf3cOriginHost', 'originHostHeader', 'sf3cOriginHostHeader', 'allowOverrideOriginCacheKey']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    salesForceCommerceCloudProvider: {
      local _ = self,
      name: 'salesForceCommerceCloudProvider',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    salesForceCommerceCloudProviderHostHeader: {
      local _ = self,
      name: 'salesForceCommerceCloudProviderHostHeader',

      hostHeaderSource:: null,

      options: {
        [name]: _[name]
        for name in ['hostHeaderSource']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    scheduleInvalidation: {
      local _ = self,
      name: 'scheduleInvalidation',

      start:: null,
      repeat:: null,
      repeatInterval:: null,
      refreshMethod:: null,

      options: {
        [name]: _[name]
        for name in ['start', 'repeat', 'repeatInterval', 'refreshMethod']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    scriptManagement: {
      local _ = self,
      name: 'scriptManagement',

      enabled:: null,
      serviceworker:: null,
      timestamp:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'serviceworker', 'timestamp']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    setVariable: {
      local _ = self,
      name: 'setVariable',

      variableName:: null,
      valueSource:: null,
      variableValue:: null,
      extractLocation:: null,
      certificateFieldName:: null,
      headerName:: null,
      responseHeaderName:: null,
      setCookieName:: null,
      cookieName:: null,
      locationId:: null,
      pathComponentOffset:: null,
      queryParameterName:: null,
      generator:: null,
      numberOfBytes:: null,
      minRandomNumber:: null,
      maxRandomNumber:: null,
      transform:: null,
      operandOne:: null,
      algorithm:: null,
      encryptionKey:: null,
      initializationVector:: null,
      encryptionMode:: null,
      nonce:: null,
      prependBytes:: null,
      formatString:: null,
      paramName:: null,
      separator:: null,
      min:: null,
      max:: null,
      hmacKey:: null,
      hmacAlgorithm:: null,
      ipVersion:: null,
      ipv6Prefix:: null,
      ipv4Prefix:: null,
      subString:: null,
      regex:: null,
      replacement:: null,
      caseSensitive:: null,
      globalSubstitution:: null,
      startIndex:: null,
      endIndex:: null,
      exceptChars:: null,
      forceChars:: null,
      deviceProfile:: null,

      options: {
        [name]: _[name]
        for name in ['variableName', 'valueSource', 'variableValue', 'extractLocation', 'certificateFieldName', 'headerName', 'responseHeaderName', 'setCookieName', 'cookieName', 'locationId', 'pathComponentOffset', 'queryParameterName', 'generator', 'numberOfBytes', 'minRandomNumber', 'maxRandomNumber', 'transform', 'operandOne', 'algorithm', 'encryptionKey', 'initializationVector', 'encryptionMode', 'nonce', 'prependBytes', 'formatString', 'paramName', 'separator', 'min', 'max', 'hmacKey', 'hmacAlgorithm', 'ipVersion', 'ipv6Prefix', 'ipv4Prefix', 'subString', 'regex', 'replacement', 'caseSensitive', 'globalSubstitution', 'startIndex', 'endIndex', 'exceptChars', 'forceChars', 'deviceProfile']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    simulateErrorCode: {
      local _ = self,
      name: 'simulateErrorCode',

      errorType:: null,
      timeout:: null,

      options: {
        [name]: _[name]
        for name in ['errorType', 'timeout']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    siteShield: {
      local _ = self,
      name: 'siteShield',

      ssmap:: null,

      options: {
        [name]: _[name]
        for name in ['ssmap']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    strictHeaderParsing: {
      local _ = self,
      name: 'strictHeaderParsing',

      validMode:: null,
      strictMode:: null,

      options: {
        [name]: _[name]
        for name in ['validMode', 'strictMode']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    sureRoute: {
      local _ = self,
      name: 'sureRoute',

      enabled:: null,
      type:: null,
      customMap:: null,
      testObjectUrl:: null,
      toHostStatus:: null,
      toHost:: null,
      raceStatTtl:: null,
      forceSslForward:: null,
      allowFCMParentOverride:: null,
      enableCustomKey:: null,
      customStatKey:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'type', 'customMap', 'testObjectUrl', 'toHostStatus', 'toHost', 'raceStatTtl', 'forceSslForward', 'allowFCMParentOverride', 'enableCustomKey', 'customStatKey']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    teaLeaf: {
      local _ = self,
      name: 'teaLeaf',

      enabled:: null,
      limitToDynamic:: null,
      ibmCustomerId:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'limitToDynamic', 'ibmCustomerId']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    tieredDistribution: {
      local _ = self,
      name: 'tieredDistribution',

      enabled:: null,
      tieredDistributionMap:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'tieredDistributionMap']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    tieredDistributionCustomization: {
      local _ = self,
      name: 'tieredDistributionCustomization',

      customMapEnabled:: null,
      customMapName:: null,
      serialStart:: null,
      serialEnd:: null,
      hashAlgorithm:: null,
      mapMigrationEnabled:: null,
      migrationWithinCwMapsEnabled:: null,
      location:: null,
      migrationStartDate:: null,
      migrationEndDate:: null,

      options: {
        [name]: _[name]
        for name in ['customMapEnabled', 'customMapName', 'serialStart', 'serialEnd', 'hashAlgorithm', 'mapMigrationEnabled', 'migrationWithinCwMapsEnabled', 'location', 'migrationStartDate', 'migrationEndDate']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    timeout: {
      local _ = self,
      name: 'timeout',

      value:: null,

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    validateEntityTag: {
      local _ = self,
      name: 'validateEntityTag',

      enabled:: null,
      nonStrictEnabled:: null,
      weakEnabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'nonStrictEnabled', 'weakEnabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    verifyTokenAuthorization: {
      local _ = self,
      name: 'verifyTokenAuthorization',

      useAdvanced:: null,
      location:: null,
      locationId:: null,
      algorithm:: null,
      escapeHmacInputs:: null,
      ignoreQueryString:: null,
      key:: null,
      transitionKey:: null,
      salt:: null,
      failureResponse:: null,

      options: {
        [name]: _[name]
        for name in ['useAdvanced', 'location', 'locationId', 'algorithm', 'escapeHmacInputs', 'ignoreQueryString', 'key', 'transitionKey', 'salt', 'failureResponse']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    virtualWaitingRoom: {
      local _ = self,
      name: 'virtualWaitingRoom',

      cloudletSharedPolicy:: null,
      domainConfig:: null,
      customCookieDomain:: null,
      waitingRoomPath:: null,
      waitingRoomAssetsPaths:: null,
      sessionDuration:: null,
      sessionAutoProlong:: null,

      options: {
        [name]: _[name]
        for name in ['cloudletSharedPolicy', 'domainConfig', 'customCookieDomain', 'waitingRoomPath', 'waitingRoomAssetsPaths', 'sessionDuration', 'sessionAutoProlong']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    virtualWaitingRoomWithEdgeWorkers: {
      local _ = self,
      name: 'virtualWaitingRoomWithEdgeWorkers',


      options: {
        [name]: _[name]
        for name in []
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    visitorPrioritization: {
      local _ = self,
      name: 'visitorPrioritization',

      enabled:: null,
      cloudletPolicy:: null,
      userIdentificationByCookie:: null,
      userIdentificationKeyCookie:: null,
      userIdentificationByHeaders:: null,
      userIdentificationKeyHeaders:: null,
      userIdentificationByIp:: null,
      userIdentificationByParams:: null,
      userIdentificationKeyParams:: null,
      allowedUserCookieEnabled:: null,
      allowedUserCookieLabel:: null,
      allowedUserCookieDuration:: null,
      allowedUserCookieRefresh:: null,
      allowedUserCookieAdvanced:: null,
      allowedUserCookieAutomaticSalt:: null,
      allowedUserCookieSalt:: null,
      allowedUserCookieDomainType:: null,
      allowedUserCookieDomain:: null,
      allowedUserCookieHttpOnly:: null,
      waitingRoomCookieEnabled:: null,
      waitingRoomCookieShareLabel:: null,
      waitingRoomCookieLabel:: null,
      waitingRoomCookieDuration:: null,
      waitingRoomCookieAdvanced:: null,
      waitingRoomCookieAutomaticSalt:: null,
      waitingRoomCookieSalt:: null,
      waitingRoomCookieDomainType:: null,
      waitingRoomCookieDomain:: null,
      waitingRoomCookieHttpOnly:: null,
      waitingRoomStatusCode:: null,
      waitingRoomUseCpCode:: null,
      waitingRoomCpCode:: null,
      waitingRoomNetStorage:: null,
      waitingRoomDirectory:: null,
      waitingRoomCacheTtl:: null,

      options: {
        [name]: _[name]
        for name in ['enabled', 'cloudletPolicy', 'userIdentificationByCookie', 'userIdentificationKeyCookie', 'userIdentificationByHeaders', 'userIdentificationKeyHeaders', 'userIdentificationByIp', 'userIdentificationByParams', 'userIdentificationKeyParams', 'allowedUserCookieEnabled', 'allowedUserCookieLabel', 'allowedUserCookieDuration', 'allowedUserCookieRefresh', 'allowedUserCookieAdvanced', 'allowedUserCookieAutomaticSalt', 'allowedUserCookieSalt', 'allowedUserCookieDomainType', 'allowedUserCookieDomain', 'allowedUserCookieHttpOnly', 'waitingRoomCookieEnabled', 'waitingRoomCookieShareLabel', 'waitingRoomCookieLabel', 'waitingRoomCookieDuration', 'waitingRoomCookieAdvanced', 'waitingRoomCookieAutomaticSalt', 'waitingRoomCookieSalt', 'waitingRoomCookieDomainType', 'waitingRoomCookieDomain', 'waitingRoomCookieHttpOnly', 'waitingRoomStatusCode', 'waitingRoomUseCpCode', 'waitingRoomCpCode', 'waitingRoomNetStorage', 'waitingRoomDirectory', 'waitingRoomCacheTtl']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    visitorPrioritizationFifo: {
      local _ = self,
      name: 'visitorPrioritizationFifo',

      cloudletSharedPolicy:: null,
      domainConfig:: null,
      customCookieDomain:: null,
      waitingRoomPath:: null,
      waitingRoomAssetsPaths:: null,
      sessionDuration:: null,
      sessionAutoProlong:: null,

      options: {
        [name]: _[name]
        for name in ['cloudletSharedPolicy', 'domainConfig', 'customCookieDomain', 'waitingRoomPath', 'waitingRoomAssetsPaths', 'sessionDuration', 'sessionAutoProlong']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    visitorPrioritizationFifoStandalone: {
      local _ = self,
      name: 'visitorPrioritizationFifoStandalone',


      options: {
        [name]: _[name]
        for name in []
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    webApplicationFirewall: {
      local _ = self,
      name: 'webApplicationFirewall',

      firewallConfiguration:: null,

      options: {
        [name]: _[name]
        for name in ['firewallConfiguration']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    webSockets: {
      local _ = self,
      name: 'webSockets',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    webdav: {
      local _ = self,
      name: 'webdav',

      enabled:: null,

      options: {
        [name]: _[name]
        for name in ['enabled']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
  },
  criteria: {
    advancedImMatch: {
      local _ = self,
      name: 'advancedImMatch',

      matchOperator:: null,
      matchOn:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'matchOn']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    bucket: {
      local _ = self,
      name: 'bucket',

      percentage:: null,

      options: {
        [name]: _[name]
        for name in ['percentage']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cacheability: {
      local _ = self,
      name: 'cacheability',

      matchOperator:: null,
      value:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    chinaCdnRegion: {
      local _ = self,
      name: 'chinaCdnRegion',

      matchOperator:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    clientCertificate: {
      local _ = self,
      name: 'clientCertificate',

      isCertificatePresent:: null,
      isCertificateValid:: null,
      enforceMtls:: null,

      options: {
        [name]: _[name]
        for name in ['isCertificatePresent', 'isCertificateValid', 'enforceMtls']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    clientIp: {
      local _ = self,
      name: 'clientIp',

      matchOperator:: null,
      values:: null,
      useHeaders:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'useHeaders']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    clientIpVersion: {
      local _ = self,
      name: 'clientIpVersion',

      value:: null,
      useXForwardedFor:: null,

      options: {
        [name]: _[name]
        for name in ['value', 'useXForwardedFor']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    cloudletsOrigin: {
      local _ = self,
      name: 'cloudletsOrigin',

      originId:: null,

      options: {
        [name]: _[name]
        for name in ['originId']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    contentDeliveryNetwork: {
      local _ = self,
      name: 'contentDeliveryNetwork',

      matchOperator:: null,
      network:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'network']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    contentType: {
      local _ = self,
      name: 'contentType',

      matchOperator:: null,
      values:: null,
      matchWildcard:: null,
      matchCaseSensitive:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'matchWildcard', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    debugMode: {
      local _ = self,
      name: 'debugMode',

      debugMode:: null,

      options: {
        [name]: _[name]
        for name in ['debugMode']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    deviceCharacteristic: {
      local _ = self,
      name: 'deviceCharacteristic',

      characteristic:: null,
      stringMatchOperator:: null,
      numericMatchOperator:: null,
      versionMatchOperator:: null,
      booleanValue:: null,
      stringValue:: null,
      numericValue:: null,
      versionValue:: null,
      matchCaseSensitive:: null,
      matchWildcard:: null,

      options: {
        [name]: _[name]
        for name in ['characteristic', 'stringMatchOperator', 'numericMatchOperator', 'versionMatchOperator', 'booleanValue', 'stringValue', 'numericValue', 'versionValue', 'matchCaseSensitive', 'matchWildcard']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    edgeWorkersFailure: {
      local _ = self,
      name: 'edgeWorkersFailure',

      execStatus:: null,

      options: {
        [name]: _[name]
        for name in ['execStatus']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    fileExtension: {
      local _ = self,
      name: 'fileExtension',

      matchOperator:: null,
      values:: null,
      matchCaseSensitive:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    filename: {
      local _ = self,
      name: 'filename',

      matchOperator:: null,
      values:: null,
      matchCaseSensitive:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    hostname: {
      local _ = self,
      name: 'hostname',

      matchOperator:: null,
      values:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    matchAdvanced: {
      local _ = self,
      name: 'matchAdvanced',

      description:: null,
      openXml:: null,
      closeXml:: null,

      options: {
        [name]: _[name]
        for name in ['description', 'openXml', 'closeXml']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    matchCpCode: {
      local _ = self,
      name: 'matchCpCode',

      value:: null,

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    matchResponseCode: {
      local _ = self,
      name: 'matchResponseCode',

      matchOperator:: null,
      values:: null,
      lowerBound:: null,
      upperBound:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'lowerBound', 'upperBound']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    matchVariable: {
      local _ = self,
      name: 'matchVariable',

      variableName:: null,
      matchOperator:: null,
      variableValues:: null,
      variableExpression:: null,
      lowerBound:: null,
      upperBound:: null,
      matchWildcard:: null,
      matchCaseSensitive:: null,

      options: {
        [name]: _[name]
        for name in ['variableName', 'matchOperator', 'variableValues', 'variableExpression', 'lowerBound', 'upperBound', 'matchWildcard', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    metadataStage: {
      local _ = self,
      name: 'metadataStage',

      matchOperator:: null,
      value:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    originTimeout: {
      local _ = self,
      name: 'originTimeout',

      matchOperator:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    path: {
      local _ = self,
      name: 'path',

      matchOperator:: null,
      values:: null,
      matchCaseSensitive:: null,
      normalize:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'matchCaseSensitive', 'normalize']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    queryStringParameter: {
      local _ = self,
      name: 'queryStringParameter',

      parameterName:: null,
      matchOperator:: null,
      values:: null,
      lowerBound:: null,
      upperBound:: null,
      matchWildcardName:: null,
      matchCaseSensitiveName:: null,
      matchWildcardValue:: null,
      matchCaseSensitiveValue:: null,
      escapeValue:: null,

      options: {
        [name]: _[name]
        for name in ['parameterName', 'matchOperator', 'values', 'lowerBound', 'upperBound', 'matchWildcardName', 'matchCaseSensitiveName', 'matchWildcardValue', 'matchCaseSensitiveValue', 'escapeValue']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    random: {
      local _ = self,
      name: 'random',

      bucket:: null,

      options: {
        [name]: _[name]
        for name in ['bucket']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    regularExpression: {
      local _ = self,
      name: 'regularExpression',

      matchString:: null,
      regex:: null,
      caseSensitive:: null,

      options: {
        [name]: _[name]
        for name in ['matchString', 'regex', 'caseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestCookie: {
      local _ = self,
      name: 'requestCookie',

      cookieName:: null,
      matchOperator:: null,
      value:: null,
      lowerBound:: null,
      upperBound:: null,
      matchWildcardName:: null,
      matchCaseSensitiveName:: null,
      matchWildcardValue:: null,
      matchCaseSensitiveValue:: null,

      options: {
        [name]: _[name]
        for name in ['cookieName', 'matchOperator', 'value', 'lowerBound', 'upperBound', 'matchWildcardName', 'matchCaseSensitiveName', 'matchWildcardValue', 'matchCaseSensitiveValue']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestHeader: {
      local _ = self,
      name: 'requestHeader',

      headerName:: null,
      matchOperator:: null,
      values:: null,
      matchWildcardName:: null,
      matchWildcardValue:: null,
      matchCaseSensitiveValue:: null,

      options: {
        [name]: _[name]
        for name in ['headerName', 'matchOperator', 'values', 'matchWildcardName', 'matchWildcardValue', 'matchCaseSensitiveValue']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestMethod: {
      local _ = self,
      name: 'requestMethod',

      matchOperator:: null,
      value:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestProtocol: {
      local _ = self,
      name: 'requestProtocol',

      value:: null,

      options: {
        [name]: _[name]
        for name in ['value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    requestType: {
      local _ = self,
      name: 'requestType',

      matchOperator:: null,
      value:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'value']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    responseHeader: {
      local _ = self,
      name: 'responseHeader',

      headerName:: null,
      matchOperator:: null,
      values:: null,
      lowerBound:: null,
      upperBound:: null,
      matchWildcardName:: null,
      matchWildcardValue:: null,
      matchCaseSensitiveValue:: null,

      options: {
        [name]: _[name]
        for name in ['headerName', 'matchOperator', 'values', 'lowerBound', 'upperBound', 'matchWildcardName', 'matchWildcardValue', 'matchCaseSensitiveValue']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    serverLocation: {
      local _ = self,
      name: 'serverLocation',

      locationType:: null,
      matchOperator:: null,
      countries:: null,
      continents:: null,
      regions:: null,

      options: {
        [name]: _[name]
        for name in ['locationType', 'matchOperator', 'countries', 'continents', 'regions']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    time: {
      local _ = self,
      name: 'time',

      matchOperator:: null,
      repeatInterval:: null,
      repeatDuration:: null,
      lastingDuration:: null,
      lastingDate:: null,
      repeatBeginDate:: null,
      applyDaylightSavingsTime:: null,
      beginDate:: null,
      endDate:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'repeatInterval', 'repeatDuration', 'lastingDuration', 'lastingDate', 'repeatBeginDate', 'applyDaylightSavingsTime', 'beginDate', 'endDate']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    tokenAuthorization: {
      local _ = self,
      name: 'tokenAuthorization',

      matchOperator:: null,
      statusList:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'statusList']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    userAgent: {
      local _ = self,
      name: 'userAgent',

      matchOperator:: null,
      values:: null,
      matchWildcard:: null,
      matchCaseSensitive:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'values', 'matchWildcard', 'matchCaseSensitive']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    userLocation: {
      local _ = self,
      name: 'userLocation',

      field:: null,
      matchOperator:: null,
      countryValues:: null,
      continentValues:: null,
      regionValues:: null,
      checkIps:: null,
      useOnlyFirstXForwardedForIp:: null,

      options: {
        [name]: _[name]
        for name in ['field', 'matchOperator', 'countryValues', 'continentValues', 'regionValues', 'checkIps', 'useOnlyFirstXForwardedForIp']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    userNetwork: {
      local _ = self,
      name: 'userNetwork',

      field:: null,
      matchOperator:: null,
      networkTypeValues:: null,
      networkValues:: null,
      bandwidthValues:: null,
      checkIps:: null,
      useOnlyFirstXForwardedForIp:: null,

      options: {
        [name]: _[name]
        for name in ['field', 'matchOperator', 'networkTypeValues', 'networkValues', 'bandwidthValues', 'checkIps', 'useOnlyFirstXForwardedForIp']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    variableError: {
      local _ = self,
      name: 'variableError',

      result:: null,
      variableNames:: null,

      options: {
        [name]: _[name]
        for name in ['result', 'variableNames']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    virtualWaitingRoomRequest: {
      local _ = self,
      name: 'virtualWaitingRoomRequest',

      matchOperator:: null,
      matchOn:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'matchOn']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
    visitorPrioritizationRequest: {
      local _ = self,
      name: 'visitorPrioritizationRequest',

      matchOperator:: null,
      matchOn:: null,

      options: {
        [name]: _[name]
        for name in ['matchOperator', 'matchOn']
        if std.objectHasAll(_, name) && _[name] != null
      },
    },
  },
}

