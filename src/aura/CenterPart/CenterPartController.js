({

    handleChannelItemsListChange: function(component, event, helper) {
        if (component.get('v.isChannelItemsListChangeShouldBeHandled')) {
            helper.handleChannelItemsListChange(component, event, helper);
        }
    }

})