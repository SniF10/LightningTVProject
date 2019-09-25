public class SignInLightningTVController {

    	public Boolean req{get;set;}

    public PageReference show(){

    	Cookie cookieMy = ApexPages.currentPage().getCookies().get('USER_EMAIL_COOKIE');

    	System.debug('cookieMy = ' + cookieMy);

    	System.debug('cookieMy = ' + cookieMy);

    	if(cookieMy!=null){

        	req = true;

    	}else{

        	req = false;

    	}

   		return null;

    }

}