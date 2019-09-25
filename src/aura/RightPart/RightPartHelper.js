({

    startTime: function(component, helper) {
        var today = new Date();
        component.set('v.today', today);
        window.setTimeout(
            $A.getCallback(function() {
                helper.startTime(component, helper);
            }), 500
        );
    }
    
})