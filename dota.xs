/*
dizzy/silence (highlight,flash=true)
stun/knock down (hightlight, flash=false)
immobilize (turn unit around?)
freeze (fakify)
slow down (only for heroes)
hp +- (only for heroes)
LOS +- (only for heroes)

magic immunity (unit speaking)

dot
direct damage

summon creature
miss chance
critical hits
illusions
transform to settler(hex) (attack to zero)
deathmatch->ability draft

STR:
-hp bonus
-hp regen bonus
-damage (for STR heroes)

INT:
-mana bonus
-mana regen bonus
-damage (for INT heroes)
-higher spell resistance?
DXT:
-higher enemy miss chance
-attack speed (by damageunit during attacks)
-damage (for DXT heroes)
*/
float mySize=400;
void Z(string t=""){
	rmAddTriggerEffect("Message");
	rmSetTriggerEffectParam("Text", " */ "+t+" /* ");
}
int conn=0;
void createconn(int h=0, int e=0) {
	conn=conn+1;
	int f = rmCreateConnection("road"+conn);
	rmAddConnectionArea(f, e);
	rmAddConnectionArea(f, h);
	rmSetConnectionBaseHeight(f,0);
	rmSetConnectionCoherence(f,1.0);
	rmAddConnectionTerrainReplacement(f, "texas\ground2_tex","texas\ground3_tex");
	rmSetConnectionWidth(f, 8, 1.0);
	rmBuildConnection(f);
}
int areas = 0;
int area_vector(float x1=0, float y1=0, float z1=0) {
	areas=areas+1;
	int e = rmCreateArea("towerground_"+areas);
	rmSetAreaLocation(e,x1,z1); 
	//rmSetAreaBaseHeight(e,4.0);
	rmSetAreaCoherence(e,1.0);
	//rmSetAreaHeightBlend(e,2);
	rmSetAreaSize(e,0.5/400.0,0.5/400);
	//if(type=="TownCenter") rmSetAreaSize(e,0.01,0.01);
	rmSetAreaTerrainType(e,"texas\ground3_tex");//texas\ground5_tex
	rmBuildArea(e);
	
	/*
	vector ret = cOriginVector;
	ret = xsVectorSetX(ret,x1);
	ret = xsVectorSetY(ret,y1);
	ret = xsVectorSetZ(ret,z1);
	*/
	return (e);
}
void main(void) { 
	rmSetStatusText("",0.01); 
	rmSetStatusText("",0.20);
	rmSetMapSize(mySize,mySize); 
	rmTerrainInitialize("texas\ground2_tex",0);
	
	int amazonRiver = rmRiverCreate(-1, "Amazon River", 2, 1, 6, 6);
	rmRiverSetConnections(amazonRiver, 0.5, 1.0, 0.5, 0.0);	
	rmRiverSetBankNoiseParams(amazonRiver, 0.07, 2, 1.5, 20.0, 0.667, 2.0);
	rmSetRiverFoundationParams(1.0,0.001);
	rmRiverSetShallowRadius(amazonRiver, 100);
	rmRiverAddShallow(amazonRiver, 0.2);
	rmRiverAddShallow(amazonRiver, 0.5);
	rmRiverAddShallow(amazonRiver, 0.8);
	rmRiverBuild(amazonRiver);
	rmRiverReveal(amazonRiver, 2); 
	
	int radiant_ancient = area_vector(0.1,0,0.5);
	int radiant_tower1  = area_vector(0.12,0,0.5+0.02);
	int radiant_tower2  = area_vector(0.12,0,0.5-0.02);
	
	int radiant_mid_tower3  = area_vector(0.2,0,0.5);
	int radiant_mid_tower4  = area_vector(0.3,0,0.5);
	int radiant_mid_tower5  = area_vector(0.4,0,0.5);
	
	int radiant_bottom_tower3 = area_vector(0.14,0,0.5-0.09);
	int radiant_top_tower4  = area_vector(0.14+0.1,0,0.5+0.09+0.08);
	int radiant_top_tower5  = area_vector(0.14+0.2,0,0.5+0.09+0.16);
	
	int radiant_top_tower3  = area_vector(0.14,0,0.5+0.09);
	int radiant_bottom_tower4  = area_vector(0.14+0.1,0,0.5-0.09-0.1);
	int radiant_bottom_tower5  = area_vector(0.14+0.22,0,0.5-0.09-0.22);
	
	createconn(radiant_top_tower3,radiant_top_tower5);
	createconn(radiant_bottom_tower3,radiant_bottom_tower5);
	createconn(radiant_mid_tower3,radiant_mid_tower5);
	
	int dire_ancient = area_vector(1.0-0.1,0,0.5);
	int dire_tower1  = area_vector(1.0-0.12,0,0.5+0.02);
	int dire_tower2  = area_vector(1.0-0.12,0,0.5-0.02);
	
	int dire_mid_tower3  = area_vector(1.0-0.2,0,0.5);
	int dire_mid_tower4  = area_vector(1.0-0.3,0,0.5);
	int dire_mid_tower5  = area_vector(1.0-0.4,0,0.5);
	
	int dire_bottom_tower3 = area_vector(1.0-0.14,0,0.5-0.09);
	int dire_top_tower4  = area_vector(1.0-(0.14+0.1),0,0.5+0.09+0.08);
	int dire_top_tower5  = area_vector(1.0-(0.14+0.2),0,0.5+0.09+0.16);
	
	int dire_top_tower3  = area_vector(1.0-0.14,0,0.5+0.09);
	int dire_bottom_tower4  = area_vector(1.0-(0.14+0.1),0,0.5-0.09-0.1);
	int dire_bottom_tower5  = area_vector(1.0-(0.14+0.22),0,0.5-0.09-0.22);
	
	createconn(dire_top_tower3,dire_top_tower5);
	createconn(dire_bottom_tower3,dire_bottom_tower5);
	createconn(dire_mid_tower3,dire_mid_tower5);
	
	
	int forest=rmCreateArea("side forest");
	rmSetAreaWarnFailure(forest, false);
	rmSetAreaSize(forest, rmAreaTilesToFraction(1400), rmAreaTilesToFraction(1400));
	rmSetAreaLocation(forest,0.5,0.35);
	rmSetAreaForestType(forest, "great plains forest");
	rmSetAreaForestDensity(forest, 0.7);
	rmSetAreaForestClumpiness(forest, 0.8);
	rmSetAreaForestUnderbrush(forest, 0.0);
	rmSetAreaCoherence(forest, 0.5);
	// rmSetAreaSmoothDistance(forest, 10);
	rmBuildArea(forest);
	int forest2=rmCreateArea("side forest 2");
	rmSetAreaWarnFailure(forest2, false);
	rmSetAreaSize(forest2, rmAreaTilesToFraction(1400), rmAreaTilesToFraction(1400));
	rmSetAreaLocation(forest2,0.5,0.65);
	rmSetAreaForestType(forest2, "great plains forest");
	rmSetAreaForestDensity(forest2, 0.7);
	rmSetAreaForestClumpiness(forest2, 0.8);
	rmSetAreaForestUnderbrush(forest2, 0.0);
	rmSetAreaCoherence(forest2, 0.5);
	// rmSetAreaSmoothDistance(forest2, 10);
	rmBuildArea(forest2);
	
	int a = rmCreateArea("unitpicker");
	rmSetAreaLocation(a,120.0/400.0,40.0/400.0); 
	//rmSetAreaBaseHeight(e,4.0);
	rmSetAreaCoherence(a,1.0);
	//rmSetAreaHeightBlend(e,2);
	rmSetAreaSize(a,4.0/400.0,4.0/400.0);
	rmSetAreaTerrainType(a,"amazon\ground_road_spc_ama");//texas\ground5_tex
	rmBuildArea(a);

	rmSetStatusText("",0.40);
	rmSetPlacementTeam(0);
	rmPlacePlayersLine(0.1, 0.5-0.2, 0.1, 0.5+0.2, 1.0, 1.0);
	rmSetPlacementTeam(1);
	rmPlacePlayersLine(0.8, 0.5-0.2, 0.8, 0.5+0.2, 1.0, 1.0);

	for(creep_spawner_player=2;<cNumberPlayers){
		if(rmGetPlayerTeam(creep_spawner_player)!=rmGetPlayerTeam(1)) {
			break;
		}
	}
	int RADIANT = 1;
	int DIRE = creep_spawner_player;

	rmSetStatusText("",0.60);
	rmAddObjectDefItem(rmCreateObjectDef("e"),"CinematicBlock",1,0.0);//hero
	rmAddObjectDefItem(rmCreateObjectDef("c"),"CinematicBlock",1,0.0);
	rmAddObjectDefItem(rmCreateObjectDef("o"),"Outpost",1,0.0);
	rmAddObjectDefItem(rmCreateObjectDef("h"),"HotAirBalloon",1,0.0);
	rmAddObjectDefItem(rmCreateObjectDef("m"),"Market",1,0.0);
	rmAddObjectDefItem(rmCreateObjectDef("t"),"SPCFortCenter",1,0);
	rmAddObjectDefItem(rmCreateObjectDef("f"),"FieldHospital",1,0);
	rmAddObjectDefItem(rmCreateObjectDef("ci"),"CinematicBlock",1,0.0);
	rmAddObjectDefItem(rmCreateObjectDef("cin"),"CinematicBlock",1,0.0);
	rmAddObjectDefItem(rmCreateObjectDef("s"),"Settler",1,0.0);

	
	
	
	//unit selection data
	for(i=1;<cNumberPlayers){
		for(bit=0;<32) {
			rmPlaceObjectDefAtLoc(7,i,0.5,0.5+(rmXMetersToFraction(5)*bit),1);
		}
	}
	int firstbit=rmGetUnitPlaced(7,0);

	//spell cast and item buy/use (command data)
	for(i=1;<cNumberPlayers){	
		for(bit=0;<8) {
			rmPlaceObjectDefAtLoc(7,i,0.5,0.5-(rmXMetersToFraction(5)*bit),1);
		}
	}
	
	for(i=1;<cNumberPlayers){
		rmPlaceObjectDefAtLoc(0,i,rmPlayerLocXFraction(i)-rmXMetersToFraction(5),rmPlayerLocZFraction(i),1);
		rmAddUnitsToArmy(i,0,0);
	}
	int firsthero=rmGetUnitPlaced(0,0);
	for(i=1;<cNumberPlayers){
		rmPlaceObjectDefAtLoc(9,i,rmPlayerLocXFraction(i)-rmXMetersToFraction(5),rmPlayerLocZFraction(i)+rmXMetersToFraction(5),1);
	}
	int firstsettler=rmGetUnitPlaced(9,0);
	
	for(i=1;<cNumberPlayers){ 
		rmPlaceObjectDefAtLoc(3,i,rmPlayerLocXFraction(i)+rmXMetersToFraction(5),rmPlayerLocZFraction(i),1);
	}
	int firsthotballon=rmGetUnitPlaced(3,0);
	for(i=1;<cNumberPlayers){ 
		rmPlaceObjectDefAtLoc(8,i,rmPlayerLocXFraction(i)+rmXMetersToFraction(5),rmPlayerLocZFraction(i),1);
	}
	int firstteleport=rmGetUnitPlaced(8,0);
	//creeps in cinematic block form
	for(i=0;<1000){
		rmPlaceObjectDefAtLoc(1,1,0.125,0.5,1);
	}
	int first_radiant_creep=rmGetUnitPlaced(1,0);
	for(i=0;<1000){
		rmPlaceObjectDefAtLoc(1,creep_spawner_player,1.0-0.125,0.5,1);
	}
	int first_dire_creep=rmGetUnitPlaced(1,1000);
	//neutrals in cinematic block form
	for(i=0;<1000){
		rmPlaceObjectDefAtLoc(1,0,150.0/400.0,180.0/400.0,1);
	}
	int first_neutral_creep=rmGetUnitPlaced(1,2000);
	
	//rmPlaceObjectDefAtLoc(2,1,0.1,0.5,1);
	//rmPlaceObjectDefAtLoc(2,creep_spawner_player,0.9,0.5,1);

	rmPlaceObjectDefAtLoc(4,1,0.1-rmXMetersToFraction(10),0.5,1);
	rmPlaceObjectDefAtLoc(4,creep_spawner_player,0.9+rmXMetersToFraction(10),0.5,1);
	rmPlaceObjectDefAtLoc(6,1,0.1-rmXMetersToFraction(20),0.5,1);
	rmPlaceObjectDefAtLoc(6,creep_spawner_player,0.9+rmXMetersToFraction(20),0.5,1);
	
	rmPlaceObjectDefAtLoc(1,0,150.0/400.0,180.0/400.0,1);
	int firstneutral=rmGetUnitPlaced(1,3000);
	rmCreateArmy(0,"0,0");
	rmPlaceObjectDefAtLoc(1,0,150.0/400.0,220.0/400.0,1);
	
	rmPlaceObjectDefAtAreaLoc(5, RADIANT, radiant_ancient, 1);
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_tower1, 1);
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_tower2, 1);
	
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_mid_tower3, 1);
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_mid_tower4, 1);
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_mid_tower5, 1);
	
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_bottom_tower3, 1);
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_top_tower4, 1);
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_top_tower5, 1);
	
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_top_tower3, 1);
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_bottom_tower4, 1);
	rmPlaceObjectDefAtAreaLoc(2, RADIANT, radiant_bottom_tower5, 1);
	
	rmPlaceObjectDefAtAreaLoc(5, DIRE, dire_ancient, 1);
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_tower1, 1);
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_tower2, 1);
	
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_mid_tower3, 1);
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_mid_tower4, 1);
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_mid_tower5, 1);
	
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_bottom_tower3, 1);
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_top_tower4, 1);
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_top_tower5, 1);
	
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_top_tower3, 1);
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_bottom_tower4, 1);
	rmPlaceObjectDefAtAreaLoc(2, DIRE, dire_bottom_tower5, 1);
	
	rmSetStatusText("",0.80);

	rmSwitchToTrigger(rmCreateTrigger("b"));
	rmSetTriggerActive(false);
	rmAddTriggerEffect("Message");
	rmSetTriggerEffectParam("Text", "\");}} /*");
	
	//global variables
	Z("bool singleplayer=true;");
	Z("int radiant_creep_start=0;");
	Z("int radiant_creep_end=0;");
	Z("int dire_creep_start=0;");
	Z("int dire_creep_end=0;");
	Z("int neutral_creep_start=0;");
	Z("int neutral_creep_end=0;");
	Z("int radiant_dead_creeps=-1;");
	Z("int radiant_creeppos=-1;");
	Z("int creepwave=-1;");
	Z("int creep_spawner_player=-1;");
	Z("int bits=-1;");
	Z("int bitsv2=-1;");
	Z("int q_cooldown=-1;");
	Z("int w_cooldown=-1;");
	Z("int e_cooldown=-1;");
	Z("int r_cooldown=-1;");
	Z("int y_cooldown=-1;");
	Z("int x_cooldown=-1;");
	Z("int y_item=-1;");
	Z("int x_item=-1;");
	Z("int y_amount=-1;");
	Z("int x_amount=-1;");

	
	Z("int gold=-1;");
	Z("int kills=-1;");
	Z("int exp=-1;");
	Z("int lvl=-1;");
	Z("int skillpoints=-1;");
	Z("int mana=-1;");
	Z("int maxmana=-1;");
	Z("int manaregen=-1;");
	Z("int hpregen=-1;");
	Z("int magicresistance=-1;");
	Z("int misschance=-1;");
	
	Z("int CC_time=-1;");
	Z("int CC_type=-1;");
	Z("int CC_size=999;");
	Z("int CC_unit=-1;");
	Z("int CC_param1=-1;");
	
	Z("int move_to=-1;");
	Z("int move_action=-1;");
	Z("int move_range=-1;");
	
	Z("int keys=-1;");
	Z("int lastattack=-1;");
	Z("int note=-1;");
	Z("int auratimer=0;");
	Z("int onesectimer=0;");
	
	Z("bool pick=true;");
	Z("int picked=-1;");
	Z("float MAX_HEROES = -1;");
	Z("int heroes=-1;");
	Z("int heroes_names=-1;");
	Z("int heroes_q=-1;");
	Z("int heroes_w=-1;");
	Z("int heroes_e=-1;");
	Z("int heroes_r=-1;");
	Z("int q_level=-1;");
	Z("int w_level=-1;");
	Z("int e_level=-1;");
	Z("int r_level=-1;");
	Z("int heroes_portrait=-1;");
	Z("int heroes_desc=-1;");
	// ---- spells -----
	Z("const int STORMHAMMER=0;");
	Z("const int PASSIVEHP=1;");
	Z("const int PASSIVECLEAVE=2;");
	Z("const int HEAL=3;");
	Z("const int STUN10SEC=4;");
	Z("const int MAMELUKE_DEATH_CIRCLE=5;");
	// ----- items -----
	Z("const int BUYWARD=70;");
	Z("const int USEWARD=71;");
	//------------------
	Z("int cooldown=-1;");
	Z("int mana_cost=-1;");
	
	Z("const int cPlayerRelationAny = 99999;");
	Z("const int cPlayerRelationSelf = 100000;");
	Z("const int cPlayerRelationEnemy = 100002;");
	Z("const int cPlayerRelationAlly = 100001;");

	Z("const float PI=3.14;");
	
	//global functions
	Z("vector sin_cos(float x=0){");
	Z("	float i = 1;");
	Z(" vector ret=xsVectorSetX(vector(0,0,1),x);");
	Z(" vector acc=vector(1,0,1);");
	Z("	float fact = 1;");
	Z("	float pow = x;");
	Z("	while ((acc!=cOriginVector) && (i < 100)){");
	Z("		fact = fact*(2.0*i);");
	Z("		pow=pow*((-1.0)*x);");
	Z("     acc=xsVectorSetZ(acc,pow/fact);");
	Z("		fact=fact*(2.0*i+1);");
	Z("		pow=pow*x;");
	Z("     acc=xsVectorSetX(acc,pow/fact);");
	Z("     ret=ret+acc;");
	Z("		i=i+1;");
	Z("	}");
	Z("	return (ret);");
	Z("}");
	
	Z("void docommand(int id=0) {");
	Z(" saveCamera(\"tempcamera\");");
	Z(" int pow=1;");
	Z(" for(bit=0;<8) { ");
	Z("  if((id/pow)!=((id/pow)/2)*2) {");
	Z("   uiLookAtAndSelectUnit(xsArrayGetInt(bitsv2,8*(trCurrentPlayer()-1)+bit));");
	Z("   uiDeleteSelectedUnit();");
	Z("  }");
	Z("  pow=pow*2;");
	Z(" }");
	Z(" uiClearSelection();");
	Z(" loadCamera(\"tempcamera\");");
	Z("}");
	Z("void selectunit(int id=0) {");
	Z(" saveCamera(\"tempcamera\");");
	Z(" int pow=1;");
	Z(" for(bit=0;<32) { ");
	Z("  if((id/pow)!=((id/pow)/2)*2) {");
	Z("   uiLookAtAndSelectUnit(xsArrayGetInt(bits,32*(trCurrentPlayer()-1)+bit));");
	Z("   uiDeleteSelectedUnit();");
	Z("  }");
	Z("  pow=pow*2;");
	Z(" }");
	Z(" uiClearSelection();");
	Z(" loadCamera(\"tempcamera\");");
	Z("}");

	Z("int dounitselect(int type=1) {");
	Z(" uiSelectionButtonDown();");
	Z(" uiSelectionButtonUp();");
	Z("  xsSetContextPlayer(trCurrentPlayer());");
	Z("  kbLookAtAllUnitsOnMap();");
	Z("  int q=kbUnitQueryCreate(\"\");");
	Z("  kbUnitQueryResetData(q);");
	Z("  kbUnitQueryResetResults(q);");
	Z("  if(type==cPlayerRelationSelf) {");
	Z("   kbUnitQuerySetPlayerID(q,trCurrentPlayer());");
	Z("  }");
	Z("  else {");
	Z("   kbUnitQuerySetPlayerID(q,-1);");
	Z("   kbUnitQuerySetPlayerRelation(q,type);");
	Z("  }");
	Z("  kbUnitQuerySetUnitType(q,626);");
	Z("  kbUnitQuerySetState(q,2);");
	Z("  kbUnitQueryExecute(q);");
	Z("  int ret=-1;");
	Z("  for(j=0;<kbUnitQueryNumberResults(q)) {");
	Z("   int unit=kbUnitQueryGetResult(q,j);");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID(unit);");
	Z("   if(trUnitIsSelected()){");
	Z("    ret=unit;");
	Z("    break;");
	Z("   }");
	Z("  }");
	Z("  kbUnitQueryDestroy(q);");	
	Z(" return(ret);");
	Z("}");
	
	Z("void useballoon() {");
	Z(" saveCamera(\"tempcamera\");");
	Z(" uiLookAtAndSelectUnit("+firsthotballon+"+(trCurrentPlayer()-1));");
	Z(" loadCamera(\"tempcamera\");");
	Z(" uiWorkAtPointer();");
	Z(" uiClearSelection();");
	Z("}");
	
	Z("void rightclick(int a=-1) {");
	Z(" if(xsArrayGetInt(lastattack,trCurrentPlayer())+3000<trTimeMS()) {");
	Z(" bool deny=false;");
	Z(" bool hero=false;");
	Z(" trUnitSelectClear();");
	Z(" trUnitSelectByID("+(firsthero)+"+trCurrentPlayer()-1);");
	Z(" if(trUnitIsSelected()) {");
	Z("  hero=true;");
	Z(" }");
	Z(" uiSelectionButtonDown();");
	Z(" uiSelectionButtonUp();");
	Z("  xsSetContextPlayer(trCurrentPlayer());");
	Z("  kbLookAtAllUnitsOnMap();");
	Z("  int q=kbUnitQueryCreate(\"\");");
	Z("  kbUnitQueryResetData(q);");
	Z("  kbUnitQueryResetResults(q);");
	Z("  kbUnitQuerySetPlayerID(q,trCurrentPlayer());");
	Z("  kbUnitQuerySetUnitType(q,kbGetProtoUnitID(\"Pikeman\"));");
	Z("  kbUnitQuerySetState(q,2);");
	Z("  kbUnitQueryExecute(q);");
	Z("  for(j=0;<kbUnitQueryNumberResults(q)) {");
	Z("   int unit=kbUnitQueryGetResult(q,j);");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID(unit);");
	Z("   if(trUnitIsSelected()){");
	Z("    deny=true;");
	//Z("    xsArraySetInt(lastattack,trCurrentPlayer(),trTimeMS());");
	Z("    selectunit(unit);");
	Z("    docommand(1);");
	Z("   }");
	Z("  }");
	Z("  kbUnitQueryDestroy(q);");	
	Z(" if(hero==true) {");
	Z("  saveCamera(\"tempcamera\");");
	Z("  uiLookAtAndSelectUnit("+(firsthero)+"+trCurrentPlayer()-1);");
	Z("  loadCamera(\"tempcamera\");");
	Z("  ");
	Z(" }");
	Z(" if(deny==false) {");
	Z("  uiWorkAtPointer();");
	Z("  if(kbUnitGetActionType("+(firsthero)+"+trCurrentPlayer()-1)==15)");
	Z("   trChatSendToPlayer(0,-1,\"ok\");");
	Z(" }");
	Z(" }");
	Z("}");
	Z("void leftclick(int a=-1) {");
	Z(" uiSelectionButtonDown();");
	Z(" uiSelectionButtonUp();");
	Z("  xsSetContextPlayer(trCurrentPlayer());");
	Z("  kbLookAtAllUnitsOnMap();");
	Z("  int q=kbUnitQueryCreate(\"\");");
	Z("  kbUnitQueryResetData(q);");
	Z("  kbUnitQueryResetResults(q);");
	Z("  kbUnitQuerySetPlayerID(q,trCurrentPlayer());");
	Z("  kbUnitQuerySetUnitType(q,kbGetProtoUnitID(\"Pikeman\"));");
	Z("  kbUnitQuerySetState(q,2);");
	Z("  kbUnitQueryExecute(q);");
	Z("  for(j=0;<kbUnitQueryNumberResults(q)) {");
	Z("   int unit=kbUnitQueryGetResult(q,j);");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID(unit);");
	Z("   if(trUnitIsSelected()){");
	Z("    uiClearSelection();");
	Z("    break;");
	Z("   }");
	Z("  }");
	Z("  kbUnitQueryDestroy(q);");	
	Z("  q=kbUnitQueryCreate(\"\");");
	Z("  kbUnitQueryResetData(q);");
	Z("  kbUnitQueryResetResults(q);");
	Z("  kbUnitQuerySetPlayerID(q,trCurrentPlayer());");
	Z("  kbUnitQuerySetUnitType(q,kbGetProtoUnitID(\"HotAirBalloon\"));");
	Z("  kbUnitQuerySetState(q,2);");
	Z("  kbUnitQueryExecute(q);");
	Z("  for(j=0;<kbUnitQueryNumberResults(q)) {");
	Z("   int unit3=kbUnitQueryGetResult(q,j);");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID(unit3);");
	Z("   if(trUnitIsSelected()){");
	Z("    uiClearSelection();");
	Z("    break;");
	Z("   }");
	Z("  }");
	Z("  kbUnitQueryDestroy(q);");	
	//********** shop **************
	Z("  xsSetContextPlayer(1);");
	Z("  kbLookAtAllUnitsOnMap();");
	Z("  q=kbUnitQueryCreate(\"\");");
	Z("  kbUnitQueryResetData(q);");
	Z("  kbUnitQueryResetResults(q);");
	Z("  kbUnitQuerySetPlayerID(q,1);");
	Z("  kbUnitQuerySetUnitType(q,kbGetProtoUnitID(\"Market\"));");
	Z("  kbUnitQuerySetState(q,2);");
	Z("  kbUnitQueryExecute(q);");
	Z("  for(j=0;<kbUnitQueryNumberResults(q)) {");
	Z("   int unit2=kbUnitQueryGetResult(q,j);");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID(unit2);");
	Z("   if(trUnitIsSelected()){");
	Z("    uiClearSelection();");
	Z("    string padding=\"    \";");
	Z("    trShowSPCNote(\"Shop\",\"(Key A) Shield - 5 gold, upgradable\"+padding+");
	Z("     \"(Key B) Ward\"+padding);");
	Z("    pause();");
	Z("    break;");
	Z("   }");
	Z("  }");
	Z("  kbUnitQueryDestroy(q);");	
	//******************************
	Z("}");
	
	Z("void empower(int a=-1) {");
	Z(" useballoon();");
	Z(" docommand(2);");
	Z(" editMode(\"None\");");
	Z("}");
	
	Z("void key_pressed(int id=-1) {");
	Z(" id=id-100;");
	Z(" int cooldown_array_id=-1;");
	Z(" if(xsArrayGetInt(cooldown,id)!=-1) {");
	Z("  if(xsArrayGetInt(heroes_q,xsArrayGetInt(picked,trCurrentPlayer()))==id)");
	Z("   cooldown_array_id=q_cooldown;");
	Z("  if(xsArrayGetInt(heroes_w,xsArrayGetInt(picked,trCurrentPlayer()))==id)");
	Z("   cooldown_array_id=w_cooldown;");
	Z("  if(xsArrayGetInt(heroes_e,xsArrayGetInt(picked,trCurrentPlayer()))==id)");
	Z("   cooldown_array_id=e_cooldown;");
	Z("  if(xsArrayGetInt(heroes_r,xsArrayGetInt(picked,trCurrentPlayer()))==id)");
	Z("   cooldown_array_id=r_cooldown;");
	Z("  if(cooldown_array_id!=-1){");
	Z("   if(trTime()-xsArrayGetInt(cooldown_array_id,trCurrentPlayer())<xsArrayGetInt(cooldown,id)) {");
	Z("    trChatSendToPlayer(0,trCurrentPlayer(),\"spell is on cooldown\");");
	Z("    return;");
	Z("   }");
	Z("  }");
	Z(" }");
	Z(" if(xsArrayGetInt(mana_cost,id)!=-1) {");
	Z(" }");
	Z(" if(cooldown_array_id!=-1) {");
	Z("  xsArraySetInt(cooldown_array_id,trCurrentPlayer(),trTime());");
	Z(" }");
	Z(" if(id==STUN10SEC) {");
	Z("  specialPower(trCurrentPlayer(),9,9);");
	Z("  map(\"mouse1down\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,\"+STUN10SEC+\");\");");
	Z(" }");
	Z(" if(id==HEAL) {");
	Z("  docommand(HEAL);");
	Z(" }");
	Z(" if(id==USEWARD) {");
	Z("  specialPower(trCurrentPlayer(),9,9);");
	Z("  map(\"mouse1down\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,\"+USEWARD+\");\");");
	Z(" }");
	Z(" if(id==MAMELUKE_DEATH_CIRCLE) {");
	Z("  specialPower(trCurrentPlayer(),3,11);");
	Z("  map(\"mouse1down\",\"root\",\" trackInsert();trackAddWaypoint();trackPlay(-1,\"+MAMELUKE_DEATH_CIRCLE+\");\");");
	Z(" }");
	Z("}");
	
	Z("void key_use(int id=-1) {");
	Z(" if(id==STUN10SEC) {");
	Z("  selectunit(dounitselect(cPlayerRelationEnemy));");
	Z("  docommand(STUN10SEC);");
	Z("  editMode(\"None\");");
	Z("  map(\"mouse1down\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,\"+(10004)+\");\");");
	Z(" }");
	Z(" if(id==USEWARD) {");
	Z("  useballoon();");
	Z("  docommand(USEWARD);");
	Z("  editMode(\"None\");");
	Z("  map(\"mouse1down\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,\"+(10004)+\");\");");
	Z(" }");
	Z(" if(id==MAMELUKE_DEATH_CIRCLE) {");
	Z("  useballoon();");
	Z("  docommand(MAMELUKE_DEATH_CIRCLE);");
	Z("  editMode(\"None\");");
	Z("  map(\"mouse1down\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,\"+(10004)+\");\");");
	Z(" }");
	Z("}");
	

	

	Z("void buy_a(int a=-1) {");
	Z(" trChatSendToPlayer(0,trCurrentPlayer(),\"You have just bought an item!\");");
	Z("}");
	Z("void buy_b(int a=-1) {");
	Z(" if(xsArrayGetInt(gold,trCurrentPlayer())<10) {");
	Z("  trChatSendToPlayer(0,trCurrentPlayer(),\"You have not enough gold!\");");
	Z("  return;");
	Z(" }");
	Z(" docommand(BUYWARD);");
	Z("}");
	
	
	
	
	Z("void healunit(int number=0,float y=0) {");
	Z("trUnitSelectClear();");
	Z("trUnitSelectByID(number);");
	Z("int p=kbUnitGetPlayerID(number);");
	//Z("xsSetContextPlayer(p);");
	Z("float x=0;");
	Z("if(kbUnitGetCurrentHitpoints(number)==kbUnitGetMaximumHitpoints(number)) {");
	Z(" x=0;");
	Z("}");
	Z("else if(kbUnitGetCurrentHitpoints(number)+y>=kbUnitGetMaximumHitpoints(number)) {");
	Z(" x=100000000;");
	Z("}");
	Z("else {");
	Z(" x=((-1.0)*kbUnitGetMaximumHitpoints(number))*y/(kbUnitGetCurrentHitpoints(number) -");
	Z("	 kbUnitGetMaximumHitpoints(number) + y);");
	Z("}");
	Z("if(x!=0) {");
	Z("trUnitConvert(0);");
	Z(" trModifyProtounit(kbGetProtoUnitName(kbGetUnitBaseTypeID(number)), 0, 0, x);");
	Z(" trUnitConvert(p);");
	Z(" trModifyProtounit(kbGetProtoUnitName(kbGetUnitBaseTypeID(number)), 0, 0, (-1.0)*x);");
	Z("}");
	Z("}");

	Z("void spelllevel(int a=-1) {");
	Z(" if(xsArrayGetInt(skillpoints,trCurrentPlayer())==0) {");
	Z("  trChatSendToPlayer(0,-1,\"You dont have any skillpoints to spend.\");");
	Z(" }");
	Z(" else {");
	Z("  trShowChoiceDialog(\"|Q| unskilled\",\"level up\",-1,\"next spell\",-1);");
	Z(" }");
	Z("}");

	Z("void KEYS(string a=\"\",");
	Z("string b=\"\",");
	Z("string c=\"\",");
	Z("string d=\"\",");
	Z("string e=\"\",");
	Z("string f=\"\",");
	Z("string g=\"\",");
	Z("string h=\"\",");
	Z("string i=\"\",");
	Z("string j=\"\"){");
	Z(" static int count=0;");
	Z(" xsArraySetString(keys,count,a);");
	Z(" xsArraySetString(keys,count+1,b);");
	Z(" xsArraySetString(keys,count+2,c);");
	Z(" xsArraySetString(keys,count+3,d);");
	Z(" xsArraySetString(keys,count+4,e);");
	Z(" xsArraySetString(keys,count+5,f);");
	Z(" xsArraySetString(keys,count+6,g);");
	Z(" xsArraySetString(keys,count+7,h);");
	Z(" xsArraySetString(keys,count+8,i);");
	Z(" xsArraySetString(keys,count+9,j);");
	Z(" count=count+10;");
	Z("}");
	
	Z(" int lastunit=-1;");
	Z("void test(int a=-1) { ");

	Z("  xsSetContextPlayer(1);");
	Z("  kbLookAtAllUnitsOnMap();");
	Z("  int qqq=kbUnitQueryCreate(\"\");");
	Z("  kbUnitQueryResetData(qqq);");
	Z("  kbUnitQueryResetResults(qqq);");
	Z("  kbUnitQuerySetPlayerID(qqq,1);");
	Z("  kbUnitQuerySetUnitType(qqq,kbGetProtoUnitID(\"HouseMed\"));");
	Z("  kbUnitQuerySetState(qqq,2);");
	Z("  kbUnitQueryExecute(qqq);");
	Z("  for(j=0;<kbUnitQueryNumberResults(qqq)) {");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID(kbUnitQueryGetResult(qqq,j));");
	Z("   lastunit=kbUnitQueryGetResult(qqq,j);");
	Z("   trUnitChangeProtoUnit(\"Musketeer\");");
	Z("  }");
	Z("  kbUnitQueryDestroy(qqq);");	
	Z("}");
	///////////////////////////
	Z("rule init priority 1 {");
	///////////////////////////
	Z(" xsSetContextPlayer(1);");
	
	Z("MAX_HEROES = 8;");
	Z("heroes=xsArrayCreateString(MAX_HEROES+1,\"\",\"\");");
	Z("heroes_names=xsArrayCreateString(MAX_HEROES+1,\"\",\"\");");
	Z("heroes_portrait=xsArrayCreateString(MAX_HEROES+1,\"\",\"\");");
	Z("heroes_desc=xsArrayCreateString(MAX_HEROES+1,\"\",\"\");");
	Z("heroes_q=xsArrayCreateInt(MAX_HEROES+1,0,\"\");");
	Z("heroes_w=xsArrayCreateInt(MAX_HEROES+1,0,\"\");");
	Z("heroes_e=xsArrayCreateInt(MAX_HEROES+1,0,\"\");");
	Z("heroes_r=xsArrayCreateInt(MAX_HEROES+1,0,\"\");");
	
	Z("cooldown=xsArrayCreateInt(101,-1,\"\");");
	Z("mana_cost=xsArrayCreateInt(101,-1,\"\");");
	
	Z(" xsArraySetString(heroes,1,\"SPCWashington\");");
	Z(" xsArraySetString(heroes_names,1,\"Washington\");");
	Z(" xsArraySetString(heroes_portrait,1,\"Art\\units\\spc\\george_washington\\george_washington_igc_icon\");");
	Z(" xsArraySetString(heroes_desc,1,\"Strength hero\");");
	Z(" xsArraySetInt(heroes_q,1,STORMHAMMER);");
	Z(" xsArraySetInt(heroes_w,1,PASSIVEHP);");
	Z(" xsArraySetInt(heroes_e,1,PASSIVECLEAVE);");
	Z(" xsArraySetInt(heroes_r,1,HEAL);");
	Z(" xsArraySetInt(cooldown,HEAL,60);");
	Z(" xsArraySetInt(mana_cost,HEAL,100);");
	
	Z(" xsArraySetString(heroes,2,\"Explorer\");");
	Z(" xsArraySetString(heroes_names,2,\"Explorer\");");
	Z(" xsArraySetString(heroes_portrait,2,\"Art\\units\\explorers\\explorer_portrait\");");
	Z(" xsArraySetString(heroes_desc,2,\"Agility hero\");");
	Z(" xsArraySetInt(heroes_q,2,STUN10SEC);");
	Z(" xsArraySetInt(cooldown,STUN10SEC,60);");
	Z(" xsArraySetInt(mana_cost,STUN10SEC,100);");
	Z(" xsArraySetInt(heroes_w,2,PASSIVEHP);");
	Z(" xsArraySetInt(heroes_e,2,PASSIVECLEAVE);");
	Z(" xsArraySetInt(heroes_r,2,HEAL);");
	
	Z(" xsArraySetString(heroes,3,\"Strelet\");");
	Z(" xsArraySetString(heroes_names,3,\"Strelet\");");
	Z(" xsArraySetString(heroes_portrait,3,\"Art\\units\\infantry_ranged\\strelet\\strelet_portrait\");");
	
	Z(" xsArraySetString(heroes,4,\"Janissary\");");
	Z(" xsArraySetString(heroes_names,4,\"Janissary\");");
	Z(" xsArraySetString(heroes_portrait,4,\"Art\\units\\infantry_ranged\\janissary\\janissary_icon_128\");");
	
	Z(" xsArraySetString(heroes,5,\"MercMameluke\");");
	Z(" xsArraySetString(heroes_names,5,\"Mameluke\");");
	Z(" xsArraySetString(heroes_portrait,5,\"Art\\units\\mercenaries\\mameluke\\mameluke_portrait\");");
	Z(" xsArraySetInt(heroes_q,5,STUN10SEC);");
	Z(" xsArraySetInt(cooldown,MAMELUKE_DEATH_CIRCLE,60);");
	Z(" xsArraySetInt(mana_cost,MAMELUKE_DEATH_CIRCLE,100);");
	Z(" xsArraySetInt(heroes_w,5,PASSIVEHP);");
	Z(" xsArraySetInt(heroes_e,5,PASSIVECLEAVE);");
	Z(" xsArraySetInt(heroes_r,5,MAMELUKE_DEATH_CIRCLE);");
	
	Z(" xsArraySetString(heroes,6,\"Dragoon\");");
	Z(" xsArraySetString(heroes_names,6,\"Dragoon\");");
	Z(" xsArraySetString(heroes_portrait,6,\"Art\\units\\calvary\\dragoon\\dragoon_portrait\");");
	
	Z(" xsArraySetString(heroes,7,\"Priest\");");
	Z(" xsArraySetString(heroes_names,7,\"Priest\");");
	Z(" xsArraySetString(heroes_portrait,7,\"Art\\units\\priests\\we_priest_portrait\");");
	
	Z(" xsArraySetString(heroes,8,\"Dopplesoldner\");");
	Z(" xsArraySetString(heroes_names,8,\"Dopplesoldner\");");
	Z(" xsArraySetString(heroes_portrait,8,\"Art\\units\\infantry\\dopplesoldner\\dopplesoldner_portrait\");");
	//Explorer
	//SPCBeaumont
	//SPCAlain
	//SPCAmelia
	//SPCBolivar
	//SPCCooper
	//SPCDelgado
	//SPCGreatPlainsChief
	//SPCJohn
	//SPCKanyenke
	//SPCLizzie
	//SPCMorgan
	//SPCNonahkee
	//SPCStuart
	//SPCSahin
	//SPCWarwick
	//SPCWashington	
	Z("q_level=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z("w_level=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z("e_level=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z("r_level=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z("lvl=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z("skillpoints=xsArrayCreateInt(cNumberPlayers,2,\"\");");
		
	Z(" creepwave=xsArrayCreateInt(2,0,\"\");");
	Z(" creep_spawner_player=xsArrayCreateInt(2,1,\"\");");
	Z(" radiant_dead_creeps=xsArrayCreateBool(1000,true,\"\");");
	Z(" CC_time=xsArrayCreateInt(1000,-10,\"\");");
	Z(" CC_type=xsArrayCreateInt(1000,-1,\"\");");
	Z(" CC_unit=xsArrayCreateInt(1000,-1,\"\");");
	Z(" CC_param1=xsArrayCreateInt(1000,-1,\"\");");
	
	Z(" move_to=xsArrayCreateVector(cNumberPlayers,cInvalidVector,\"\");");
	Z(" move_action=xsArrayCreateInt(cNumberPlayers,-1,\"\");");
	Z(" move_range=xsArrayCreateInt(cNumberPlayers,-1,\"\");");
	
	Z(" bits=xsArrayCreateInt(32*(cNumberPlayers-1),0,\"\");");
	Z(" bitsv2=xsArrayCreateInt(8*(cNumberPlayers-1),0,\"\");");
	Z(" q_cooldown=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" w_cooldown=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" e_cooldown=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" r_cooldown=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" y_cooldown=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" x_cooldown=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" y_item=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" x_item=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" y_amount=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" x_amount=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" gold=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" kills=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" lastattack=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" note=xsArrayCreateBool(cNumberPlayers,false,\"\");");
	Z(" exp=xsArrayCreateInt(cNumberPlayers,0,\"\");");
	Z(" mana=xsArrayCreateInt(cNumberPlayers,100,\"\");");
	Z(" maxmana=xsArrayCreateInt(cNumberPlayers,100,\"\");");
	Z(" manaregen=xsArrayCreateFloat(cNumberPlayers,2,\"\");");
	Z(" hpregen=xsArrayCreateFloat(cNumberPlayers,2,\"\");");
	Z(" magicresistance=xsArrayCreateFloat(cNumberPlayers,0,\"\");");
	Z(" misschance=xsArrayCreateFloat(cNumberPlayers,0,\"\");");
	Z(" radiant_creeppos=xsArrayCreateVector(1000,cOriginVector,\"\");");

	Z(" picked=xsArrayCreateInt(cNumberPlayers,-1,\"\");");
	
	Z(" for(i=1;<cNumberPlayers) {");
	Z("  for(bit=0;<32){ ");
	Z("   xsArraySetInt(bits,32*(i-1)+bit,"+firstbit+"+bit+(i-1)*32);");
	Z("  }");
	Z(" }");
	Z(" for(i=1;<cNumberPlayers) {");
	Z("  for(bit=0;<8){ ");
	Z("   xsArraySetInt(bitsv2,8*(i-1)+bit,"+firstbit+"+((cNumberPlayers-1)*32)+bit+(i-1)*8);");
	Z("  }");
	Z(" }");
	
	Z(" for(i=2;<cNumberPlayers) {");
	Z("  if(kbGetPlayerTeam(i)!=kbGetPlayerTeam(1)) {");
	Z("   xsArraySetInt(creep_spawner_player,1,i);");
	Z("   break;");
	Z("  }");
	Z(" }");
	Z(" for(team=0;<=1)");
	Z("  trModifyProtounit(\"SPCDelgado\",xsArrayGetInt(creep_spawner_player,team),0,3000);");
	Z(" for(i=1;<2) {");
	Z("  trModifyProtounit(\"HotAirBalloon\",i,1,400);");
	Z("  for(j=0;<1000) {");
	//Z("   trTechSetStatus(i,457,0);");//merc dmg
	//Z("   trTechSetStatus(i,457,2);");
	//Z("   trTechSetStatus(i,360,0);");//imperial age explorer upgrade
	//Z("   trTechSetStatus(i,360,2);");
	Z("  }");
	//Z(" trModifyProtounit(\"Outpost\", i, 16, 1000000.0);");
	Z(" }");
	Z(" for(i=1;<cNumberPlayers) {");
	Z("  trCreateDefendPlan(\"\"+i+\",0\",\"plan\"+i,200,0,200,0,0.2,0);");
	Z("  trPlayerSetHCAccess(i,false);");
	Z(" }");
	//Z(" trUnitSelectClear();");
	//Z(" trUnitSelectByID(32+cNumberPlayers);");
	//Z(" trUnitSelectByID(32+cNumberPlayers+cNumberPlayers);");
	//Z(" trUnitMakeInvulnerable(true);");
	//Z(" trUnitPlayerFakify(0);");
	Z(" trBlockAllSounds(false);");
	
	Z(" trSetFogAndBlackmap(true,false);");
	Z(" ");
	Z(" singleplayer=true;");
	Z(" bool tutorial=false;");
	Z(" for(i=2;<cNumberPlayers) {");
	Z("  if(kbIsPlayerHuman(i)) singleplayer=false;");
	Z(" }");
	Z(" if(singleplayer && (kbGetPlayerHandicap(2)==0.3)) {");
	Z("  tutorial=true;");
	Z("  trChatSendToPlayer(0,-1,\"Welcome in tutorial mode. \"+");
	Z("	  \"The Computer will guide you throgh the most important points of the game.\");");
	Z(" }");
	Z(" trUnitSelectClear();");
	Z(" trUnitSelectByID("+(firsthero)+"+1-1);");
	//hosting the game with sandbox difficulty, no handicap and in singleplayer mode enables the tutorial.
	
	Z(" keys=xsArrayCreateString(200,\"\",\"\");");
	Z(" KEYS(\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\");");
	Z(" KEYS(\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\");");
	Z(" KEYS(\"u\",\"v\",\"w\",\"x\",\"y\",\"z\",\"0\",\"1\",\"2\",\"3\");");
	Z(" KEYS(\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"numpad0\",\"numpad1\",\"numpad2\",\"numpad3\");");
	Z(" KEYS(\"numpad4\",\"numpad5\",\"numpad6\",\"numpad7\",\"numpad8\",\"numpad9\",\"F1\",\"F2\",\"F3\",\"F4\");");
	Z(" KEYS(\"F5\",\"F6\",\"F7\",\"F8\",\"F9\",\"F10\",\"F11\",\"F12\",\"esc\",\"printscreen\");");
	Z(" KEYS(\"pause\",\"insert\",\"home\",\"pageup\",\"pagedown\",\"end\",\"delete\",\"space\",\"enter\",\"tab\");");
	Z(" KEYS(\"numpadplus\",\"numpadminus\",\"numpaddivide\",\"arrowup\",\"arrowdown\",\"arrowright\",\"arrowleft\");");
	Z(" KEYS(\"backspace\",\"capslock\",\"numlock\",\"mouse3up\",\"[\",\"]\",\"/\",\"'\",\".\",\";\");");
	Z(" KEYS(\",\",\"-\",\"`\",\"mouse2down\",\"mouse1down\",\"mouse1up\",\"mouse2up\",\"mousez\",\"mouse1doubledown\");");
	Z(" KEYS(\"mouse1doubleup\",\"mouse2doubleup\",\"mouse2doubledown\",\"control\",\"alt\",\"shift\");");
	Z(" KEYS(\"mouse3doubleup\",\"\",\"mouse3doubledown\",\"\",\"mouse3down\",\"\");");
	
	Z(" for(i=0;<200) {");
	Z("  if(xsArrayGetString(keys,i)!=\"\") {");
	Z("   map(xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"alt-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"alt-control-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"alt-shift-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"alt-control-shift-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"alt-shift-control-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"control-alt-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"control-shift-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"control-alt-shift-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"control-shift-alt-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"control-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"shift-alt-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"shift-control-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"shift-alt-control-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"shift-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("   map(\"shift-control-alt-\"+xsArrayGetString(keys,i),\"root\",\"\");");
	Z("  }");
	Z(" }");

	//restore general hotkeys
	Z(" map(\"mousex\", \"root\", \"movePointerX\");");
	Z(" map(\"mousey\", \"root\", \"movePointerY\");");
	Z(" map(\"/\", \"game\", \"uiFindType("+"\\"+"Hero"+"\\"+")\");");
	Z(" map(\"'\", \"game\", \"uiFindType("+"\\"+"Ship"+"\\"+")\");");
	Z(" map(\".\", \"game\", \"uiFindIdleType("+"\\"+"ValidIdleVillager"+"\\"+")\");");
	Z(" map(\";\", \"game\", \"uiFindType("+"\\"+"AbstractWagon"+"\\"+")\");");
	
	//custom hotkeys
	Z(" map(\"q\",\"root\",\" editMode("+"\\"+"empower"+"\\"+")\");");
	Z(" map(\"r\",\"root\",\" specialPower(\"+trCurrentPlayer()+\",4,3)\");");


	Z(" trEventFire();");
	Z(" map(\"mouse1down\",\"specialpower\",\" \");");
	Z(" trEventSetHandler(10003,\"rightclick\");");
	Z(" trEventSetHandler(10004,\"leftclick\");");
	Z(" trEventSetHandler(10005,\"empower\");");
	Z(" trEventSetHandler(10006,\"buy_a\");");
	Z(" trEventSetHandler(10011,\"buy_b\");");
	Z(" trEventSetHandler(10009,\"spelllevel\");");
	Z(" trEventSetHandler(11111,\"test\");");
	Z(" for(i=1;<100) trEventSetHandler(i+100,\"key_pressed\");");
	Z(" for(i=1;<100) trEventSetHandler(i,\"key_use\");");

	Z(" map(\"F1\", \"root\", \"restartCurrentGame\");");
	Z(" map(\"tab\",\"root\",\" gadgetUnreal("+"\\"+"commandpanel2commands"+"\\"+")\");");
	
	Z("gadgetUnreal(\"commandpanel2commands\");");
	Z("gadgetUnreal(\"minimapPanel-dpwood\");");
	Z("gadgetUnreal(\"minimapPanel-dpfood\");");
	Z("gadgetUnreal(\"minimapPanel-dptotalPopLeft\");");
	

	Z("if(pick) {");

		Z(" map(\"mouse2down\",\"root\",\" uiWorkAtPointer();\");");
		Z(" map(\"mouse1down\",\"root\",\" uiSelectionButtonDown();uiSelectionButtonUp();\");");

		
		Z("vector pickerpos = vector(120.0,0,40.0);");
		
		Z("trUnitSelectClear();");
		Z("for(heroes_number=0;<MAX_HEROES) {");
		Z(" vector xz=pickerpos+sin_cos(PI*2.0/MAX_HEROES*heroes_number-PI)*12.0;");
		Z(" string name=xsArrayGetString(heroes,heroes_number+1);");
		Z(" trArmyDispatch(\"0,\"+(heroes_number+1),name,1,xsVectorGetX(xz),0,xsVectorGetZ(xz),0,true);");
		Z(" trArmySelect(\"0,\"+(heroes_number+1));");

		Z("}");
		Z(" trUnitMakeInvulnerable(true);");
		
		Z(" for(i=1;<cNumberPlayers){");
		Z("  trUnitSelectClear();");
		Z("  trArmyDispatch(\"\"+i+\",1\",\"IGCFlagBearer\",1,xsVectorGetX(pickerpos),0,xsVectorGetZ(pickerpos),0,true);");
		Z("  trArmySelect(\"\"+i+\",1\");");
		Z("  trPlayerSetDiplomacy(0,i,\"ally\");");
		Z("  trPlayerSetDiplomacy(i,0,\"ally\");");
		Z("  trModifyProtounit(\"IGCFlagBearer\",i,2,10);");
		Z("  trUnitMakeInvulnerable(true);");
		Z(" }");
		
				
		Z("trMessageSetText(\"move your flag bearer man to a hero to pick him\",-1);");
		
		Z(" trSetFogAndBlackmap(false,false);");
		Z(" trCounterAddTime(\"okk\",30,0,\"pick a hero!\",-1);");
		Z(" lookAt(xsVectorGetX(pickerpos),xsVectorGetZ(pickerpos));");

		//Z(" gadgetUnreal(\"ShowChoiceBox-Select-1\");");
		Z(" gadgetUnreal(\"minimapPanel\");");
		//Z(" gadgetUnreal(\"unitselectionpanel\");");
		//Z(" gadgetUnreal(\"unitstatpanel\");");
		Z(" gadgetToggle(\"AGameMinimap\");");
		//Z(" gadgetUnreal(\"commandpanel2-main\");");
		
	Z("}");


	Z(" trModifyProtounit(\"HouseMed\",1,4,-9000); ");
	Z(" trModifyProtounit(\"HouseMed\",1,16,-100);");
	Z(" xsDisableSelf();");
	Z("}");
	


	
	/////////////////////
	Z("rule main_loop priority 2 {");
	/////////////////////
	Z("  xsSetContextPlayer(0);");
	
	//disable plans that not needed
	Z(" for(i=1;<cNumberPlayers){");
	Z("  trKillAIPlan(i,\"Land Explore\");");
	Z("  trKillAIPlan(i,\"Primary Land Defend\");");
	Z("  trKillAIPlan(i,\"Land Reserve Units\");");
	Z(" }");	
	
	Z("if(pick) {");
	Z(" lookAt(120,35);");
	Z(" for(i=1;<9) {");
	Z("  trUnitSelectClear();");
	Z("  trArmySelectInt(0,i);");
	Z("  if(trGetNumberSelectedUnitIDs()==0) continue;");
	Z("  int hero=trGetSelectedUnitID(0);");
	Z("  if(kbUnitGetPlayerID(hero)!=0) continue;");
	Z("  for(j=1;<cNumberPlayers){");
	Z("   trUnitSelectClear();");
	Z("   trArmySelectInt(j,1);");
	Z("   if(trUnitDead()) continue;");
	Z("   if(trUnitDistanceToUnitID(hero)<2) {");
	Z("    trUnitDelete(true);");
	Z("    trUnitSelectClear();");
	Z("    trUnitSelectByID(hero);");
	Z("    trUnitConvert(j);");
	Z("    xsArraySetInt(picked,j,i);");
	Z("    trChatSendToPlayer(0,-1,\"Player \"+j+\" picked \"+xsArrayGetString(heroes_names,i)+");
	Z("     \" <icon=(20)(\"+xsArrayGetString(heroes_portrait,i)+\")>\");");
	Z("   }");
	Z("  }");
	Z(" }");
	Z(" if(trTime()>30) {");
	Z(" for(j=1;<cNumberPlayers) {");
	Z("  if(xsArrayGetInt(picked,j)==-1) {");
	Z("   int count=0;");
	Z("   for(i=1;<cNumberPlayers) if(xsArrayGetInt(picked,i)!=-1) count++;");
	Z("   trQuestVarSetFromRand(\"pick\",1,9-count,true);");
	Z("   for(i=1;<9) {");
	Z("    bool taken=false;");
	Z("    for(k=1;<cNumberPlayers) {");
	Z("     if(xsArrayGetInt(picked,k)==i) {");
	Z("      taken=true;");
	Z("     }");
	Z("    }");
	Z("    if(taken==false) ");
	Z("     trQuestVarSet(\"pick\",trQuestVarGet(\"pick\")-1);");
	Z("    if(trQuestVarGet(\"pick\")==0) {");
	Z("     trUnitSelectClear();");
	Z("     trArmySelectInt(0,i);");
	Z("     trUnitConvert(j);");
	Z("     trChatSendToPlayer(0,-1,\"Player \"+j+\" did not pick, randomized \"+xsArrayGetString(heroes_names,i)+");
	Z("      \" <icon=(20)(\"+xsArrayGetString(heroes_portrait,i)+\")>\");");
	Z("     xsArraySetInt(picked,j,i);");
	Z("     break;");
	Z("    }");
	Z("   }");
	Z("  }");
	Z(" }");
	//the game starts, initialization:
	Z(" pick=false;");
	Z(" gadgetReal(\"minimapPanel\");");
	Z(" gadgetToggle(\"AGameMinimap\");");
	Z(" for(i=1;<cNumberPlayers) {");
	Z("  trUnitSelectClear();");
	Z("  trUnitSelectByID("+firsthero+"+i-1);");
	Z("  trUnitChangeProtoUnit(xsArrayGetString(heroes,xsArrayGetInt(picked,i)));");
	Z("  trUnitSelectClear();");
	Z("  trArmySelectInt(0,i);");
	Z("  trUnitDelete(true);");
	Z(" }");
	
	Z(" map(\"mouse2down\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,10003);\");");
	Z(" map(\"mouse1down\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,10004);\");");
	Z(" map(\"mouse1down\",\"empower\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,10005);\");");
	Z(" map(\"space\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,10009);\");");
	Z(" map(\"s\",\"root\",\" uiStopSelectedUnits() \");");
	
	Z(" map(\"q\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,\"+");
	Z("  (xsArrayGetInt(heroes_q,xsArrayGetInt(picked,trCurrentPlayer()))+100)+\");\");");
	Z(" map(\"w\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,\"+");
	Z("  (xsArrayGetInt(heroes_w,xsArrayGetInt(picked,trCurrentPlayer()))+100)+\");\");");
	Z(" map(\"e\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,\"+");
	Z("  (xsArrayGetInt(heroes_e,xsArrayGetInt(picked,trCurrentPlayer()))+100)+\");\");");
	Z(" map(\"r\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,\"+");
	Z("  (xsArrayGetInt(heroes_r,xsArrayGetInt(picked,trCurrentPlayer()))+100)+\");\");");
	
	Z(" map(\"y\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,\"+(USEWARD+100)+\");\");");


	Z(" }");
	Z("}");
	Z("else {");
	
	Z(" gadgetReal(\"ShowImageBox-Image\");");
	Z(" trBlockAllSounds(false);");
	//Z("gadgetUnreal(\"unitselectionpanel-unit\");");
	Z(" if(trIsGadgetVisible(\"playersummarydlg\")) trChatSendToPlayer(0,-1,\"hehe\");");
	
	Z(" for(i=1;<2) {");
	Z("  xsSetContextPlayer(i);");
	//after deny you have to wait to attack again
	Z("    trUnitSelectClear();");
	Z("    trUnitSelectByID("+(firsthero)+"+i-1);");
	Z("    trUnitCinematicRemoveControlAction();");
	Z("  if((kbUnitGetActionType("+(firsthero)+"+i-1)==15)&&(xsArrayGetInt(lastattack,i)+6000<trTimeMS())){");
	Z("	  xsArraySetInt(lastattack,i,trTimeMS());");
	
	Z("  }");
	Z("  if((xsArrayGetInt(lastattack,i)+6000>trTimeMS())&&(xsArrayGetInt(lastattack,i)+500<trTimeMS())) {");
	Z("   if(kbUnitGetActionType("+(firsthero)+"+i-1)!=9) {");
	Z("    trUnitSelectClear();");
	Z("    trUnitSelectByID("+(firsthero)+"+i-1);");
	Z("    vector pos=kbUnitGetPosition("+(firsthero)+"+i-1);");
	Z("    trUnitSetStance(\"StandGround\");");
	//Z("    trUnitMoveToPoint(xsVectorGetX(pos)+0.1,xsVectorGetY(pos),xsVectorGetZ(pos),-1,false);");
	Z("    uiLookAtAndSelectUnit("+(firsthero)+"+i-1);");
	//Z("    uiStopSelectedUnits();");
	Z("   }");
	Z("  }");
	//gold for kills
	Z(" if(trGetStatValue(i,2)>xsArrayGetInt(kills,i)) {");
	Z("  xsArraySetInt(gold,i,xsArrayGetInt(gold,i)+(trGetStatValue(i,2)-xsArrayGetInt(kills,i))*50);");
	Z("  xsArraySetInt(kills,i,trGetStatValue(i,2));");
	Z(" }");
	Z(" trPlayerGrantResources(i,\"gold\",xsArrayGetInt(gold,i)-trPlayerResourceCount(i,\"gold\"));");
	Z(" }");
	//shop
	Z(" if((xsArrayGetBool(note,trCurrentPlayer())==false) && trIsGadgetVisible(\"SPCNote\")) {");
	Z("  map(\"a\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,10006);\");");
	Z("  map(\"b\",\"root\",\" trackInsert(); trackAddWaypoint();trackPlay(-1,10011);\");");
	Z("  xsArraySetBool(note,trCurrentPlayer(),true);");
	Z(" }");
	Z(" if(xsArrayGetBool(note,trCurrentPlayer()) && (trIsGadgetVisible(\"SPCNote\")==false)) {");
	Z("  map(\"a\",\"root\",\"\");");
	Z("  map(\"b\",\"root\",\"\");");
	Z("  xsArraySetBool(note,trCurrentPlayer(),false);");
	Z(" }");

	//counter
	Z(" trCounterAbort(\"ok\");");
	Z(" trCounterAddTime(\"ok\",trTimeMS()/1000,-1,\"0:0\",-1);");
	
	//stun
	Z("for(i=0;<=CC_size) {");
	Z(" if(xsArrayGetInt(CC_type,i)!=-1) {");
	Z("  if(xsArrayGetInt(CC_type,i)==1) {");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID(xsArrayGetInt(CC_unit,i));");
	//Z("   vector ppos=kbGetBlockPosition(\"\"+xsArrayGetInt(CC_unit,i));");
	//Z("   trUnitMoveToPoint(xsVectorGetX(ppos),0,xsVectorGetZ(ppos),-1,false);");
	Z("   trUnitCinematicRemoveControlAction();");
	Z("   trUnitSetHeading(360.0*(trTimeMS()-xsArrayGetInt(CC_time,i))/10000.0);");
	Z("  if(xsArrayGetInt(CC_time,i)+10000<trTimeMS()) {");
	Z("   if(xsArrayGetInt(CC_type,i)==1) {");
	Z("    xsArraySetInt(CC_type,i,-1);");
	Z("   }");
	Z("  }");
	Z(" }");
	Z("  if(xsArrayGetInt(CC_type,i)==2) {");
	Z("  if(xsArrayGetInt(CC_time,i)+10000<trTimeMS()) {");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID(xsArrayGetInt(CC_unit,i));");
	Z("   trUnitChangeProtoUnit(kbGetProtoUnitName(xsArrayGetInt(CC_param1,i)));");
	Z("   xsArraySetInt(CC_type,i,-1);");
	Z("  }");
	Z(" }");
	Z("  if(xsArrayGetInt(CC_type,i)==3) {");
	Z("  if(xsArrayGetInt(CC_time,i)+10000<trTimeMS()) {");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID(xsArrayGetInt(CC_unit,i));");
	Z("   trUnitDelete(true);");
	Z("   xsArraySetInt(CC_type,i,-1);");
	Z("  }");
	Z(" }");
	Z("}");
	Z("}");
	
	Z(" for(i=1;<cNumberPlayers) {");
	//handle move action
	Z("   if(xsArrayGetInt(move_action,i)!=-1) {");
	Z("    vector pposs=kbGetBlockPosition(\"\"+("+firsthero+"+(i-1)));");
	Z("    if(xsVectorLength(pposs-xsArrayGetVector(move_to,i))<xsArrayGetInt(move_range,i)) {");
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID(("+firsthero+"+(i-1)));");
	Z("     trUnitMoveToPoint(xsVectorGetX(pposs),0,xsVectorGetZ(pposs),-1,false);");
	Z("     if(xsArrayGetInt(move_action,i)==USEWARD) {");
	Z("      trArmyDispatch(\"\"+i+\",2\",\"Musketeer\",1,");
	Z("       xsVectorGetX(xsArrayGetVector(move_to,i)),0,xsVectorGetZ(xsArrayGetVector(move_to,i)),0,true);");
	Z("      trUnitSelectClear();");
	Z("      trArmySelect(\"\"+i+\",2\");");
	Z("      trUnitChangeProtoUnit(\"HomeCityWaterSpawnFlag\");");
	Z("     }");
	Z("     if(xsArrayGetInt(move_action,i)==MAMELUKE_DEATH_CIRCLE) {");
	Z("  xsSetContextPlayer(i);");
	Z("  kbLookAtAllUnitsOnMap();");
	Z("  int qqqqq=kbUnitQueryCreate(\"\");");
	Z("  kbUnitQueryResetData(qqqqq);");
	Z("  kbUnitQueryResetResults(qqqqq);");
	Z("   kbUnitQuerySetPlayerID(qqqqq,-1);");
	Z("   kbUnitQuerySetPlayerRelation(qqqqq,cPlayerRelationEnemy);");
	Z("  kbUnitQuerySetUnitType(qqqqq,626);");
	Z("  kbUnitQuerySetState(qqqqq,2);");
	Z("  kbUnitQueryExecute(qqqqq);");
	
	Z("  for(j=0;<kbUnitQueryNumberResults(qqqqq)) {");
	Z("  trUnitSelectClear();");
	Z("   trUnitSelectByID(kbUnitQueryGetResult(qqqqq,j));");
	Z("     ");
	Z("         for(cc=0;<=CC_size+1) {");
	Z("         if(xsArrayGetInt(CC_type,cc)==-1){");
	Z("      xsArraySetInt(CC_time,cc,trTimeMS());");
	Z("      xsArraySetInt(CC_type,cc,2);");
	Z("      xsArraySetInt(CC_unit,cc,trGetSelectedUnitID(0));");
	Z("      xsArraySetInt(CC_param1,cc,kbGetUnitBaseTypeID(trGetSelectedUnitID(0)));");
	Z("      trUnitChangeProtoUnit(\"Settler\");");
	Z("      if(cc==CC_size+1)CC_size++;");
	Z("      break;");
	Z("        }");
	Z("       }");
	Z("  }");

	Z("  kbUnitQueryDestroy(qqqqq);");	
	Z("      for(j=0;<10) {");
	Z("       vector circle=xsArrayGetVector(move_to,i)+sin_cos((2.0*PI*j)/10.0)*10.0;");
	Z("       trArmyDispatch(\"\"+i+\",2\",\"Musketeer\",1,");
	Z("        xsVectorGetX(circle),0,xsVectorGetZ(circle),0,true);");
	Z("        trUnitSelectClear();");
	Z("        trArmySelect(\"\"+i+\",2\");");

	Z("         for(cc=0;<=CC_size+1) {");
	Z("         if(xsArrayGetInt(CC_type,cc)==-1){");
	Z("      xsArraySetInt(CC_time,cc,trTimeMS());");
	Z("      xsArraySetInt(CC_type,cc,3);");
	Z("      xsArraySetInt(CC_unit,cc,trGetSelectedUnitID(0));");
	Z("       trUnitChangeProtoUnit(\"WaypointFlag\");");
	Z("      if(cc==CC_size+1)CC_size++;");
	Z("      break;");
	Z("        }");
	Z("       }");
	Z("      }");
	Z("     }");
	
	Z("     xsArraySetInt(move_action,i,-1);");
	Z("    }");
	Z("   }");
	Z("}");
	Z("trSetCinematicUnitSpeaking(\""+firsthero+"\",false,1);");
	
	
	//1 sec timer
	Z(" if(onesectimer+1000<trTimeMS()) {");

	Z(" ");
	
	Z("trSetCinematicUnitSpeaking(\""+firsthero+"\",true,1);");
	//Z(" trUnitSelectClear();trUnitSelectByID("+firsthero+");trDamageUnitPercent(10);");
	//print stats
	Z("  string padding=\"                          \";");
	Z("  string stats=\"\";");
	Z("  stats=stats+padding+\"   \"+xsArrayGetInt(mana,trCurrentPlayer());");
	Z("  stats=stats+\"/\"+xsArrayGetInt(maxmana,trCurrentPlayer())+\" +3\";");
	Z("  stats=stats+\" :_\";");
	Z("  stats=stats+padding+\"Magic Resistance: \";");
	Z("  stats=stats+(100*xsArrayGetFloat(magicresistance,trCurrentPlayer()))+\"%% \";");
	Z("  stats=stats+padding+padding+padding+padding+\"_\"+padding;");
	Z("  stats=stats+\"XP: \"+(xsArrayGetInt(exp,trCurrentPlayer()))+\" \";");
	Z("  stats=stats+padding+padding+padding+padding+\"_\"+padding;");
	Z("  stats=stats+\"Str: 20, Dex:30, Int:25 \";");
	Z("  stats=stats+\"_\"+padding;");
	Z("  if(xsArrayGetInt(y_item,trCurrentPlayer())!=0) {");
	Z("   stats=stats+\"Inventory: \"+xsArrayGetInt(y_amount,trCurrentPlayer())+\" Ward\";");
	Z("  }");
	//Z("  trSoundPlayDialog(\"default\",-1,false);");
	//Z("trSoundPlayDialog(\"default\", \"\", -1, false, stats,\"\");");
	Z("trSoundPlayFN(\"default\", \"a\",-1, stats,\"\");");
	
	Z(" for(i=1;<cNumberPlayers) {");
	Z("   xsSetContextPlayer(i);");


	//------------- get command number id -----------
	Z("    int command=0;");
	Z("    int pow_=1;");
	Z("    for(bit=0;<8) { ");
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID(xsArrayGetInt(bitsv2,8*(i-1)+bit));");
	Z("     if(trUnitDead()){");
	Z("	     command=command+pow_;");
	Z("      trUnitSelectClear();");
	Z("      trArmyDispatch(\"\"+i+\",0\",\"MercRonin\",1,200,0,200-5*bit,0,true);");
	Z("      trArmySelect(\"\"+i+\",0\");");
	Z("      xsArraySetInt(bitsv2,8*(i-1)+bit,trGetSelectedUnitID(0));");
	Z("      trUnitChangeProtoUnit(\"CinematicBlock\");");
	Z("     }");
	Z("     pow_=pow_*2;");
	Z("    }");
	//-----------------------------------------------	
	Z("   if(command==HEAL) {");
	Z("    xsSetContextPlayer(i);");
	Z("    kbLookAtAllUnitsOnMap();");
	Z("    int q3=kbUnitQueryCreate(\"\");");
	Z("    kbUnitQueryResetData(q3);");
	Z("    kbUnitQueryResetResults(q3);");
	Z("    kbUnitQuerySetPlayerID(q3,-1);");
	Z("    kbUnitQuerySetPlayerRelation(q3,cPlayerRelationAlly);");
	Z("    kbUnitQuerySetUnitType(q3,626);");
	Z("    kbUnitQuerySetState(q3,4);");
	Z("    kbUnitQueryExecute(q3);");
	Z("     for(j=0;<kbUnitQueryNumberResults(q3)) {");
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID(kbUnitQueryGetResult(q3,j));");
	Z("     trUnitChangeProtoUnit(\"SPCJohn\");");

	Z("     healunit(kbUnitQueryGetResult(q3,j),100);");

	Z("    }");
	Z("    kbUnitQueryDestroy(q3);");	
	Z("   }");
	//-------------------------------------
	Z("   if(command==STUN10SEC) {");
	Z("    int number=0;");
	Z("    int pow=1;");
	Z("    for(bit=0;<32) { ");
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID(xsArrayGetInt(bits,32*(i-1)+bit));");
	Z("     if(trUnitDead()){");
	Z("	     number=number+pow;");
	Z("      trUnitSelectClear();");
	Z("      trArmyDispatch(\"\"+i+\",0\",\"MercRonin\",1,200,0,200+5*bit,0,true);");
	Z("      trArmySelect(\"\"+i+\",0\");");
	Z("      xsArraySetInt(bits,32*(i-1)+bit,trGetSelectedUnitID(0));");
	Z("      trUnitChangeProtoUnit(\"CinematicBlock\");");
	Z("     }");
	Z("     pow=pow*2;");
	Z("    }");
	Z("    trChatSendToPlayer(0,-1,\"\"+number);");
	Z("    for(cc=0;<=CC_size+1) {");
	Z("     if(xsArrayGetInt(CC_type,cc)==-1){");
	Z("      xsArraySetInt(CC_time,cc,trTimeMS());");
	Z("      xsArraySetInt(CC_type,cc,1);");
	Z("      xsArraySetInt(CC_unit,cc,number);");
	Z("      if(cc==CC_size+1)CC_size++;");
	Z("      vector pppos=kbGetBlockPosition(\"\"+xsArrayGetInt(CC_unit,cc));");
	Z("      trUnitSelectClear();");
	Z("      trUnitSelectByID(number);");
	Z("      trUnitMoveToPoint(xsVectorGetX(pppos),0,xsVectorGetZ(pppos),-1,false);");
	//Z("     trSetCinematicUnitSpeaking(\"\"+xsArrayGetInt(CC_unit,cc),true,10000);");
	Z("      trUnitHighlight(10);");
	Z("      break;");
	Z("     }");
	Z("    }");
	Z("   }");
	//-----------------------------------------
	Z("   if(command==STORMHAMMER) {");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID("+firsthotballon+"+(i-1));");
	Z("   if((trUnitDistanceToPoint("+(rmPlayerLocXFraction(i)+rmXMetersToFraction(5))+",0,"+rmPlayerLocZFraction(i)+")>2) ");
	Z("    && (kbUnitGetActionType("+firsthotballon+"+(i-1))==7)){");
	Z("     trUnitSelectClear();");
	Z("     vector pos2=kbGetBlockPosition(\"\"+("+firsthotballon+"+(i-1)));");	
		//Z("     trArmyDispatch(\"\"+i+\",0\",\"CinematicRevealer\",1,xsVectorGetX(pos2),0,xsVectorGetZ(pos2),0,true);");
	//Z("     trUnitSelectClear();");
	//Z("     trUnitSelectByID("+firsthotballon+"+(i-1));");
	//Z("     trDamageUnitsInArea(i,\"Unit\",30,10000);");
	//**************** spell *************
	Z("  xsSetContextPlayer(i);");
	Z("  kbLookAtAllUnitsOnMap();");
	Z("  int q2=kbUnitQueryCreate(\"\");");
	Z("  kbUnitQueryResetData(q2);");
	Z("  kbUnitQueryResetResults(q2);");
	Z("  kbUnitQuerySetPlayerID(q2,-1);");
	Z("  kbUnitQuerySetPlayerRelation(q2,100002);");
	Z("  kbUnitQuerySetPosition(q2,kbGetBlockPosition(\"\"+("+firsthotballon+"+(i-1))));");
	Z("  kbUnitQuerySetMaximumDistance(q2,10);");
	Z("  kbUnitQuerySetUnitType(q2,626);");
	Z("  kbUnitQuerySetState(q2,2);");
	Z("  kbUnitQueryExecute(q2);");
	Z("  for(j=0;<kbUnitQueryNumberResults(q2)) {");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID(kbUnitQueryGetResult(q2,j));");
	Z("   for(cc=0;<=CC_size+1) {");
	Z("    if(xsArrayGetInt(CC_type,cc)==-1){");
	Z("     xsArraySetInt(CC_time,cc,trTimeMS());");
	Z("     xsArraySetInt(CC_type,cc,1);");
	Z("     xsArraySetInt(CC_unit,cc,kbUnitQueryGetResult(q2,j));");
	Z("     if(cc==CC_size+1)CC_size++;");
	Z("     vector ppos=kbGetBlockPosition(\"\"+xsArrayGetInt(CC_unit,cc));");
	//Z("     trUnitMoveToPoint(xsVectorGetX(ppos),0,xsVectorGetZ(ppos),-1,false);");
	Z("     vector balloonpos=kbGetBlockPosition(\"\"+("+firsthotballon+"+(i-1)));");
	Z("     trUnitPlayerFakify(0);");
	Z("     trUnitMoveToPoint(xsVectorGetX(balloonpos),0,xsVectorGetZ(balloonpos),-1,false);");
	//Z("     trSetCinematicUnitSpeaking(\"\"+xsArrayGetInt(CC_unit,cc),true,10000);");
	//Z("     trUnitHighlight(10);");
	Z("     break;");
	Z("    }");
	Z("   }");
	Z("  }");
	//Z("  trUnitPlayerFakify(1);");
	//Z("  trDamageUnit(10000);");
	Z("  kbUnitQueryDestroy(q2);");	
	//************************************
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID("+firstteleport+"+(i-1));");
	Z("     trUnitChangeProtoUnit(\"Galleon\");");
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID("+firsthotballon+"+(i-1));");
	Z("     trUnitChangeProtoUnit(\"Musketeer\");");
	Z("     trImmediateUnitGarrison(\"\"+("+firstteleport+"+(i-1)));");
	Z("     trUnitChangeProtoUnit(\"HotAirBalloon\");");
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID("+firstteleport+"+(i-1));");
	Z("     trUnitChangeProtoUnit(\"CinematicBlock\");");
	Z("  }");
	Z(" }");
	//------------------------------------
	Z(" if(command==BUYWARD) {");
	Z("  xsArraySetInt(y_item,i,USEWARD);");
	Z("  xsArraySetInt(y_amount,i,xsArrayGetInt(y_amount,i)+5);");
	Z(" }");
	Z(" if(command==USEWARD) {");
	Z("  xsArraySetInt(y_amount,i,xsArrayGetInt(y_amount,i)-1);");
	Z("  if(xsArrayGetInt(y_amount,i)==0) xsArraySetInt(y_item,i,0);");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID("+firsthotballon+"+(i-1));");
	Z("   if((trUnitDistanceToPoint("+(rmPlayerLocXFraction(i)+rmXMetersToFraction(5))+",0,"+rmPlayerLocZFraction(i)+")>2) ");
	Z("    && (kbUnitGetActionType("+firsthotballon+"+(i-1))==7)){");
	Z("     trUnitSelectClear();");
	Z("     vector posss=kbGetBlockPosition(\"\"+("+firsthotballon+"+(i-1)));");	
	Z("     xsArraySetVector(move_to,i,xsVectorSetY(posss,0));");
	Z("     xsArraySetInt(move_action,i,USEWARD);");
	Z("     xsArraySetInt(move_range,i,10);");
	
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID(("+firsthero+"+(i-1)));");
	Z("     trUnitMoveToPoint(xsVectorGetX(posss),0,xsVectorGetZ(posss),-1,false);");
	
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID("+firstteleport+"+(i-1));");
	Z("     trUnitChangeProtoUnit(\"Galleon\");");
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID("+firsthotballon+"+(i-1));");
	Z("     trUnitChangeProtoUnit(\"Musketeer\");");
	Z("     trImmediateUnitGarrison(\"\"+("+firstteleport+"+(i-1)));");
	Z("     trUnitChangeProtoUnit(\"HotAirBalloon\");");
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID("+firstteleport+"+(i-1));");
	Z("     trUnitChangeProtoUnit(\"CinematicBlock\");");
	Z("     ");
	Z("   }");
	Z("  }");
	Z(" if(command==MAMELUKE_DEATH_CIRCLE) {");
	Z("   trUnitSelectClear();");
	Z("   trUnitSelectByID("+firsthotballon+"+(i-1));");
	Z("   if((trUnitDistanceToPoint("+(rmPlayerLocXFraction(i)+rmXMetersToFraction(5))+",0,"+rmPlayerLocZFraction(i)+")>2) ");
	Z("    && (kbUnitGetActionType("+firsthotballon+"+(i-1))==7)){");
	Z("     trUnitSelectClear();");
	Z("     vector possss=kbGetBlockPosition(\"\"+("+firsthotballon+"+(i-1)));");	
	Z("     xsArraySetVector(move_to,i,xsVectorSetY(possss,0));");
	Z("     xsArraySetInt(move_action,i,MAMELUKE_DEATH_CIRCLE);");
	Z("     xsArraySetInt(move_range,i,10);");
	
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID(("+firsthero+"+(i-1)));");
	Z("     trUnitMoveToPoint(xsVectorGetX(possss),0,xsVectorGetZ(possss),-1,false);");
	
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID("+firstteleport+"+(i-1));");
	Z("     trUnitChangeProtoUnit(\"Galleon\");");
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID("+firsthotballon+"+(i-1));");
	Z("     trUnitChangeProtoUnit(\"Musketeer\");");
	Z("     trImmediateUnitGarrison(\"\"+("+firstteleport+"+(i-1)));");
	Z("     trUnitChangeProtoUnit(\"HotAirBalloon\");");
	Z("     trUnitSelectClear();");
	Z("     trUnitSelectByID("+firstteleport+"+(i-1));");
	Z("     trUnitChangeProtoUnit(\"CinematicBlock\");");
	Z("     ");
	Z("   }");
	Z(" }");
	Z(" }");
	//freeze
	/*
	Z("for(i=0;<=CC_size) {");
	Z(" if(xsArrayGetInt(CC_type,i)!=-1) {");
	Z("  if(xsArrayGetInt(CC_time,i)+4000<trTimeMS()) {");
	Z("   if(xsArrayGetInt(CC_type,i)==0) {");
	Z("    trUnitSelectClear();");
	Z("    trUnitSelectByID(xsArrayGetInt(CC_unit,i));");
	Z("    trUnitPlayerDefakify();");
	Z("    xsArraySetInt(CC_type,i,-1);");
	Z("   }");
	Z("  }");
	Z(" }");
	Z("}");
	*/

	Z("for(i=0;<radiant_creep_end) {");
	//grant exp at dead pikemans
	Z(" trUnitSelectClear();");
	Z(" trUnitSelect(\"\"+("+first_radiant_creep+"+i));");
	Z(" if(xsArrayGetBool(radiant_dead_creeps,i) && trUnitDead()) {");
	Z("  trChatSendToPlayer(0,-1,\"dead\");");
	Z("  for(j=1;<cNumberPlayers) {");
	Z("   if(xsVectorLength(xsArrayGetVector(radiant_creeppos,i)-kbUnitGetPosition("+(firsthero)+"+j-1))<20) {");
	Z("    xsArraySetInt(exp,j,xsArrayGetInt(exp,j)+100);");
	Z("   }");
	Z("  }");
	Z("  xsArraySetBool(radiant_dead_creeps,i,false);");
	Z(" }");
	Z(" if(xsArrayGetBool(radiant_dead_creeps,i) && (trUnitDead()==false)) {");
	Z("  xsArraySetVector(radiant_creeppos,i,kbGetBlockPosition(\"\"+("+first_radiant_creep+"+i)));");
	Z("}");
	Z("}");
	Z("  onesectimer=trTimeMS();");
	Z(" }");
	
	//displaying spells cooldown
	Z(" int qqqq=(100*(trTime()-xsArrayGetInt(r_cooldown,trCurrentPlayer()))/");
	Z(" (xsArrayGetInt(cooldown,xsArrayGetInt(heroes_r,xsArrayGetInt(picked,trCurrentPlayer())))));");
	Z(" if(qqqq>100)qqqq=100;");
	Z(" trSetCounterDisplay(\"Q:\"+qqqq+\"%%\"+");
	Z(" \" W:100%% E:100%% R:100%% Y:100%% X:100%%\");");
	/*
	//q power
	Z(" xsSetContextPlayer(1);");
	Z("  trUnitSelectClear();");
	Z("  trUnitSelectByID("+firstobject+"+33+cNumberPlayers);");
	Z(" if((trUnitDistanceToPoint(");
	Z("  "+((rmPlayerLocXFraction(1)+rmXMetersToFraction(5))*mySize)+",0,"+(rmPlayerLocZFraction(1)*mySize)+")>10)&&");
	Z("  (kbUnitGetActionType("+firstobject+"+33+cNumberPlayers)!=9)) {");
	Z("   trChatSendToPlayer(0,-1,\"okkk\");");
	Z(" }");
	*/
	//aura test
	Z(" if(auratimer+2000<trTimeMS()) {");
	Z("  xsSetContextPlayer(1);");
	Z("  kbLookAtAllUnitsOnMap();");
	Z("  int q=kbUnitQueryCreate(\"\");");
	Z("  kbUnitQueryResetData(q);");
	Z("  kbUnitQueryResetResults(q);");
	Z("  kbUnitQuerySetPlayerID(q,-1);");
	Z("  kbUnitQuerySetPlayerRelation(q,100001);");//ally
	Z("  kbUnitQuerySetPosition(q,kbUnitGetPosition("+(firsthero)+"+1-1));");
	Z("  kbUnitQuerySetMaximumDistance(q,10);");
	Z("  kbUnitQuerySetUnitType(q,626);");
	Z("  kbUnitQuerySetState(q,2);");
	Z("  kbUnitQueryExecute(q);");
	Z("  for(j=0;<kbUnitQueryNumberResults(q)) {");
	Z("   int unit=kbUnitQueryGetResult(q,j);");
	Z("   healunit(unit,10000);");//10000 hp per 2 sec
	Z("  }");
	Z("  kbUnitQueryDestroy(q);");
	Z("  auratimer=trTimeMS();");
	Z(" }");
	//spawn creeps
	
	Z(" for(team=0;<=1) {");
	Z("  if(xsArrayGetInt(creepwave,team)*30<trTime()) {");
	//Z("   trArmyDispatch(\"\"+xsArrayGetInt(creep_spawner_player,team)+\",0\",\"Pikeman\",3,50+(team*300),0,200,0,true);");
	Z("   trUnitSelectClear();");
	Z("   if(team==0)trUnitSelect(\"\"+("+first_radiant_creep+"+radiant_creep_end));");
	Z("   if(team==0)trUnitSelect(\"\"+("+first_radiant_creep+"+radiant_creep_end+1));");
	Z("   if(team==0)trUnitSelect(\"\"+("+first_radiant_creep+"+radiant_creep_end+2));");
	Z("   if(team==1)trUnitSelect(\"\"+("+first_dire_creep+"+dire_creep_end));");
	Z("   if(team==1)trUnitSelect(\"\"+("+first_dire_creep+"+dire_creep_end+1));");
	Z("   if(team==1)trUnitSelect(\"\"+("+first_dire_creep+"+dire_creep_end+2));");
	//Z("   trArmySelect(\"\"+xsArrayGetInt(creep_spawner_player,team)+\",0\");");
	Z("   trUnitChangeProtoUnit(\"Pikeman\");");
	Z("   trUnitChangeName(\"Creep\");");
	Z("   trUnitMoveToPoint(200,0,200,-1,true);");
	
	Z("   if(team==0) radiant_creep_end=radiant_creep_end+3;");
	Z("   if(team==1) dire_creep_end=dire_creep_end+3;");
	Z("   xsArraySetInt(creepwave,team,xsArrayGetInt(creepwave,team)+1);");
	Z("  }");
	Z(" }");
	//neutral creeps:
	/*
	Z(" if(trCountUnitsInArea(\""+firstneutral+"\",0,\"Wolf\",10)==0){");
	Z("  trArmyDispatch(\"0,0\",\"Wolf\",3,150,0,180,0,true);");
	Z(" }");
	Z(" if(trCountUnitsInArea(\""+(firstneutral+1)+"\",0,\"Wolf\",10)==0){");
	Z("  trArmyDispatch(\"0,0\",\"Wolf\",3,150,0,220,0,true);");
	Z(" }");
	*/
	Z("}");//end else
	
	/////// end main loop /////
	Z("}");
	///////////////////////////
	
	rmAddTriggerEffect("Message");
	rmSetTriggerEffectParam("Text", " */ rule d inactive{if(0<1){trMessageSetText(\"");
	rmSetStatusText("",1.00);
}