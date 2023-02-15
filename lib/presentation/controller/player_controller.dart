
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController{
  final audioQuary=OnAudioQuery();
  final audioPlayer=AudioPlayer();

  RxInt playIndex=0.obs;
  RxBool isPlaying=false.obs;

  RxDouble max=0.0.obs;
  RxDouble value=0.0.obs;

  RxString duration=''.obs;
  RxString position=''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkPermission();
  }

  updatePosition(){
    audioPlayer.durationStream.listen((d) {
      duration.value=d.toString().split(".")[0];
      max.value=d!.inSeconds.toDouble();
    });
    audioPlayer.positionStream.listen((p) {
      position.value=p.toString().split(".")[0];
      value.value=p.inSeconds.toDouble();
    });
  }

changeDurationToSeconde(seconds){
    var position=Duration(seconds: seconds);
    audioPlayer.seek(position);
}
  playSong({required String url,required int index}){
    playIndex.value=index;
    try{
      audioPlayer.setAudioSource(
          AudioSource.uri(Uri.parse(url)
          )
      );

      audioPlayer.play();
      isPlaying(true);
      updatePosition();
    }catch(e){

    }
  }
  checkPermission()async{
    var perm=await Permission.storage.request();
    if (perm.isGranted){
      print("Granted");
    }
    else{
      // checkPermission();
      print("dined");
    }
  }
}