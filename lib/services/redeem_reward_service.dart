import 'package:cloud_functions/cloud_functions.dart';

class RedeemRewardService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  Future<bool> redeemReward(String rewardId, String userId) async {
    try {
      HttpsCallable callable = _functions.httpsCallable('redeemReward');
      final response = await callable.call(<String, dynamic>{
        'rewardId': rewardId,
        'userId': userId,
      });

      return response.data['success'] == true;
    } catch (e) {
      print('Error redeeming reward: $e');
      return false;
    }
  }
}
