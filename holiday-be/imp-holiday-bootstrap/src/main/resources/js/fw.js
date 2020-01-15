function _scriptrule_ (ruleContextJson){
 	   var ruleContext = JSON.parse(ruleContextJson);
	   var res = {}
	  var param = ruleContext.customMap.param;
	   try{
		  res.data = scripthost.exec(ruleContext, param);
		  res.updateContext = scripthost.updateContext
	   }catch(e){
		  res.exception = e.message;
	   }
	    return JSON.stringify(res);
}
function updateData(location,pkey,pvalue){
	var metacode = "_header__"
	if(!scripthost.updateContext[metacode]){
		scripthost.updateContext[metacode] = [];
		scripthost.updateContext[metacode].push({location: location, pkey:pkey,pval:pvalue })	
	}
}

function updateChildData(metacode,location,pkey,pvalue){

	if(!scripthost.updateContext[metacode]){
		scripthost.updateContext[metacode] = [];
		scripthost.updateContext[metacode].push({location: location, pkey:pkey,pval:pvalue })	
	}
}