/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
scene = CUTSCENE.FREE;
openyoureyes = false;
scene_visited = ds_list_create();
cutscenes = ds_list_create();
create_scene(CUTSCENE.INTRO, "Intro", Cutscene_Intro);
create_scene(CUTSCENE.ACALL, "ACall", Cutscene_ACall);
enum CUTSCENE{
	INTRO,
	ACALL,
	FREE
}

phone_emit = -1;