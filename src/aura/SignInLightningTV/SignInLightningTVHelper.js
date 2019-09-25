({
	getReq : function(component,helper){
        var action = component.get("c.getRequest");
        action.setCallback(this,function(response){
        	component.set("v.signIn", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },

})