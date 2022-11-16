package kr.co.farmstory1.db;

public class CateEx {

	private static CateEx instance = new CateEx();
	public static CateEx getInstance() {
		return instance;
	}
	private CateEx() {}
	
	public String exCate(String group, String cate) {
		String cate2 = null; 
		if(group.equals("market")){
			switch(cate){
			case "1" : cate2 = "market";break;
			}
		}else if(group.equals("croptalk")){
			switch(cate){
				case "1" : cate2 = "story";break;
				case "2" : cate2 = "grow";break;
				case "3" : cate2 = "school";break;
			}
		}else if(group.equals("event")){
			switch(cate){
			case "1" : cate2 = "event";break;
			}
		}else if(group.equals("community")){
			switch(cate){
			case "1" : cate2 = "notice";break;
			case "2" : cate2 = "daymeal";break;
			case "3" : cate2 = "cooker";break;
			case "4" : cate2 = "qna";break;
			case "5" : cate2 = "faq";break;
			}
		}
		return cate2;
	}
	
	public int exResult(String group) {
		String [] arr = {"introduce","market","croptalk", "event", "community"};
		int result = 0;
		for(int i=0; i<arr.length; i++){
			if(arr[i].equals(group)){
			result = i+1;
			}
		}
		return result;
	}
}
