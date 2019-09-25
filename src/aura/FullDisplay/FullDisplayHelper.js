({

    getItems: function(component, helper) {
        var action = component.get("c.getItemsChannelData");
        action.setCallback(this, function(response) {
            if (response.getState() === 'SUCCESS') {
                var channelItemsMap = response.getReturnValue();
                if (channelItemsMap.Left != null) {
                    component.set('v.leftSectionChannelItemsList', channelItemsMap.Left);
                }
                if (channelItemsMap.Center != null) {
                    component.set('v.centerSectionChannelItemsList', channelItemsMap.Center);
                }
            }
        });
        $A.enqueueAction(action);
    }

})