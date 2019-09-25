({

    handleChannelItemsListChange: function(component, event, helper) {
        component.set('v.isChannelItemsListChangeShouldBeHandled', false);
        component.set('v.displayedChanelItem', event.getParam('value')[0]);
        helper.startTimer(component, helper);
    },

    getLeftItems: function(component, helper) {
        var action = component.get("c.getChannelItemsForSection");
        action.setParams({
            section: component.get('v.displayedChanelItem').Section__c
        });
        action.setCallback(this, function(response) {
            if (response.getState() === 'SUCCESS') {
                component.set('v.isChannelItemsListChangeShouldBeHandled', true);
                component.set("v.channelItemsList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },

    setPriority: function(component, helper) {
        var channelItemsList = component.get('v.channelItemsList');
        channelItemsList.splice(0, 1);
        if (channelItemsList && channelItemsList.length == 0) {
            helper.getLeftItems(component, helper);
        } else {
            component.set('v.displayedChanelItem', channelItemsList[0]);
            component.set('v.channelItemsList', channelItemsList);
            helper.startTimer(component, helper);
        }
    },

    startTimer: function(component, helper) {
        helper.timerId = window.setTimeout(
            $A.getCallback(function() {
                helper.setPriority(component, helper);
            }), component.get('v.displayedChanelItem').Duration_Seconds__c * 1000
        );
    }

})