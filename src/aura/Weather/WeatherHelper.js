({

    getCurrentWeather: function(component, helper, city) {
        var action = component.get('c.currentWeather');
        action.setParams({
            "city": city[0]
        });
        action.setCallback(this, function(response) {
            var state = response.getState();

            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                if (result != null) {
                    result = JSON.parse(result);
                    if (result.cod == 200) {
                        component.set('v.weather', result);
                    } else {
                        helper.message(component, 'Error!', 'error', result.message);
                    }
                } else {
                    helper.message(component, 'Error!', 'error', 'Some error occured while getting weather data');
                }
            } else if (state === "INCOMPLETE") {} else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        helper.message(component, 'Error!', 'error', errors[0].message);
                    }
                } else {
                    helper.message(component, 'Error!', 'error', 'Unknown Error');
                }
            }

        });
        helper.startTimer(component, helper, city);
        $A.enqueueAction(action);
    },

    message: function(component, title, severity, message) {
        component.set('v.message', message);
        component.set('v.title', title);
        component.set('v.severity', severity);
        var ele = component.find('message');
        $A.util.removeClass(ele, 'slds-hide');
        $A.util.addClass(ele, 'slds-show');
    },

    setPriority: function(component, helper, city) {
        city.push(city[0]);
        city.splice(0, 1);
        helper.getCurrentWeather(component, helper, city);
    },

    startTimer: function(component, helper, city) {
        helper.timerId = window.setTimeout(
            $A.getCallback(function() {
                helper.setPriority(component, helper, city);
            }), 10000
        );
    }

})