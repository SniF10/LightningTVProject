({

    doInit: function(component, event, helper) {
        var city = ['Minsk', 'London', 'Amsterdam'];
        helper.getCurrentWeather(component, helper, city);
    }
    
})