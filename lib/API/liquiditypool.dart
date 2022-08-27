import 'dart:convert';

import 'package:cryptosplit/Globals/apiurls.dart';

Future getchains() async {
  var aa = await httpcall().get(
      'https://api.covalenthq.com/v1/chains/?&key=ckey_530f50467f0f406798920b4405a');
  aa = jsonDecode(aa);
  return aa['data']['items'];
}
