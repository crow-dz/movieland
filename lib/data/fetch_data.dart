import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controller/home_crt.dart';
import '../controller/tv_detail_screen_ctr.dart';
import '../model/top_rated_tv.dart';
import '../model/tv_details.dart';
import '../utils/const/links.dart';

HomeController homeCtr = Get.put(HomeController());
TvDetailsCtr tvDetailsCtr = Get.put(TvDetailsCtr());
Future<TopRatedTv> fetchTopRatedTv() async {
  final response = await http.get(Uri.parse(
      '${Links.baseUrl}/tv/top_rated?api_key=${Links.apiKey}&language=en-US&page=1'));
  if (response.statusCode == 200) {
    homeCtr.isLoading(true);
    final data = jsonDecode(response.body);
    homeCtr.topRatedTv = TopRatedTv.fromJson(data);
    return homeCtr.topRatedTv!;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<TvDetails> fetchTvDetails(int tvId) async {
  final response = await http.get(Uri.parse(
      '${Links.baseUrl}/tv/$tvId?api_key=${Links.apiKey}&language=en-US'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    log(data.toString());
    tvDetailsCtr.tvDetails = TvDetails.fromJson(data);
    tvDetailsCtr.isReady(true);
    return tvDetailsCtr.tvDetails!;
  } else {
    throw Exception('Failed to load data');
  }
}
