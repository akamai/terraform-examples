locals {
  items_countries = {
    # Key must only use a string that matches A-Z a-z 0-9 _ or -..
    "Spain"        = "{\"key\":\"Spain\",\"code\":\"ESP\",\"language\":\"sp\",\"isd\":\"34\"}"
    "France"       = "{\"key\":\"France\",\"code\":\"FRA\",\"language\":\"fr\",\"isd\":\"33\"}"
    "Germany"      = "{\"key\":\"Germnay\",\"code\":\"DEU\",\"language\":\"de\",\"isd\":\"49\"}"
    "Italy"        = "{\"key\":\"Italy\",\"code\":\"ITA\",\"language\":\"it\",\"isd\":\"39\"}"
    "South-Africa" = "{\"key\":\"South Africa\",\"code\":\"ZAF\",\"language\":\"en\",\"isd\":\"27\"}"
  }

  items_translations = {
    "es" = "HOLA MUNDO"
    "fr" = "BONJOUR LE MONDE"
    "de" = "HALLO WELT"
    "it" = "CIAO MONDO"
    "zu" = "SAWUBONA MHLABA"
    "pt" = "OLÁ MUNDO"
  }
}
