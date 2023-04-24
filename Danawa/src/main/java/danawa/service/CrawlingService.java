package danawa.service;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import danawa.entity.Mallinfo;
import danawa.entity.NoteBookInfo;
import danawa.mapper.CrawlingMapper;



@Service
public class CrawlingService {
	
	@Autowired 
	private CrawlingMapper crawlingMapper;	 	
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver"; // 드라이버 ID
	public static final String WEB_DRIVER_PATH = "C:\\Users\\manoo\\OneDrive\\바탕 화면\\셀리니움2\\chromedriver.exe"; // 드라이버 경로

	
	public void CrawlingMallinfo() throws Exception{		
		try {
	         System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	
	      ChromeOptions options = new ChromeOptions();
	      WebDriver driver = new ChromeDriver(options);
	      
	      String url = "http://prod.danawa.com/list/?cate=112758&searchOption=searchMaker=6792,702,1452,2869,2137,2904/innerSearchKeyword=";
	      driver.get(url);
	      
	      driver.findElement(By.className("qnt_selector")).click();
	      driver.findElement(By.xpath("//*[@id=\"productListArea\"]/div[2]/div[2]/div[2]/select/option[3]")).click();

	      try {Thread.sleep(4000);} catch(InterruptedException e) {}
	      
	      List<WebElement> ahref =  driver.findElements(By.cssSelector(".prod_name a"));
	      List<String> prodList = new ArrayList<>();
	      String noProduct = "";
	      for(WebElement e : ahref) {
	         prodList.add(e.getAttribute("href"));
	      }

	      for(int i = 4; i < prodList.size(); i++) {
	         if(prodList.get(i).contains("pcode")) {
	            String prodUrl = prodList.get(i);
	            try {Thread.sleep(3000);} catch(InterruptedException e) {}
	            driver.get(prodUrl); //url 바꿔주기

	            WebElement nameEle = driver.findElement(By.className("prod_tit"));
	            try {
	            WebElement noPro =  driver.findElement(By.xpath("/html/body/div[2]/div[3]/div[2]/div[2]/div[2]/div[1]/div[2]/div[1]/p/strong"));
	             noProduct = noPro.getText();
	            } catch (Exception e) {
	            	e.printStackTrace();
				}
	           
	            String name = nameEle.getText().trim(); //제품명
	            if(name.contains("FX516PR-HN002") || name.contains("MSIGE시리즈레이더GE7612UHS4KW11 (SSD 2TB)")) continue;
	            if(noProduct.equals("일시 품절")) continue;
	            /* 가격정보 */
	            List<WebElement> priceEle = driver.findElements(By.cssSelector(".high_list .price .prc_t"));
	            List<String> priceList = new ArrayList<>();
	           
	            for(WebElement e : priceEle) {
	               if (e.getText().contains(",")) {
	                  priceList.add(e.getText().replace(",", "")); //가격
	               }
	            }
	          
	            //쇼핑몰 링크
	            List<WebElement> linkEle = driver.findElements(By.cssSelector(".high_list .logo_over a"));
	            List<String> linkList = new ArrayList<>();
	            
	            for(WebElement e : linkEle) {
	               if(!(e.getAttribute("href").contains("ajax"))) {
	                  linkList.add(e.getAttribute("href")); 
	               }
	            }
              
	            //로고이미지
	            List<String> logoList = new ArrayList<>();
	            List<String> siteNameList = new ArrayList<>();
	            List<WebElement> imgEle = driver.findElements(By.cssSelector(".high_list .logo_over img"));
	            
	            for(WebElement e : imgEle) {
	               if(!e.getAttribute("src").contains("noImg")) {
	                  logoList.add(e.getAttribute("src"));
	                  siteNameList.add(e.getAttribute("alt"));
	               }
	            }
	            
	            //Mall이름
	            for(int j = 0; j < linkEle.size(); j++) {
	               if(linkEle.get(j).getText().length() > 1) {
	                  String siteName = linkEle.get(j).getText();
	                  if(j > siteNameList.size()) {
	                     siteNameList.add(siteName);
	                     logoList.add("X");
	                  }
	                  else {
	                     siteNameList.add(j, siteName);
	                     logoList.add(j, "X");
	                  }
	               }
	            }
	            
	               List<WebElement> shippingEle = driver.findElements(By.cssSelector("#blog_content > div.summary_info > div.detail_summary > div.summary_left > div.lowest_area > div.lowest_list > table > tbody.high_list span.stxt.deleveryBaseSection"));
	               List<String> shippingList = new ArrayList<>();
	              
	               for (WebElement e : shippingEle) {
	                  shippingList.add(e.getText()); //배송비
	               }
				
				List<Mallinfo> mallInfos = new ArrayList<>(shippingList.size());		
				
				for(int k = 0; k < shippingList.size(); k++) {					
					Mallinfo mallInfo = new Mallinfo();
					mallInfo.setModelnum(name);
					mallInfo.setLink(linkList.get(k));
					mallInfo.setLogo(logoList.get(k));
					mallInfo.setPrice(Integer.parseInt(priceList.get(k)));
					mallInfo.setShipping(shippingList.get(k));
					mallInfo.setMallname(siteNameList.get(k));
					
					mallInfos.add(mallInfo);										
				}
									
				crawlingMapper.InsertMallInfo(mallInfos); //mallinfo insert
					
				List<WebElement> screeninchs = driver.findElements(By.cssSelector(".dsc a"));

				ArrayList lists = new ArrayList();
				String screeninch = "";
				for(WebElement ele : screeninchs) {
					  lists.add(ele.getText());
				}
				  
				for(int j = 0 ; j < lists.size(); j++) {
					if((lists.get(j)+"").contains("인치")){
						String [] str =(lists.get(j)+"").split("\\(");	
						for(int k = 0; k < str.length; k++) {
							if(!(str[k].contains("cm"))) {
							screeninch = (str[k]+"").replace(")", "").replace("인치", "");
							}
						}
					  }
				  	}
				  
				  List<WebElement> weights = driver.findElements(By.cssSelector(".dsc a"));
					 
				  String weight = "";
				  for(WebElement ele : weights) {
					  lists.add(ele.getText());
				  }
				  
				  for(int k = 0 ; k < lists.size(); k++) {
					  if((lists.get(k)+"").contains("kg")){
						  weight =  (lists.get(k)+"").replace("kg", ""); break;
						
					  }
				  }
				  				  				  
				  WebElement elee =  driver.findElement(By.cssSelector(".maker_link"));
				  String company = elee.getText();
				  
					
					
				  String price = driver.findElement(By.cssSelector(".prc_c")).getText();
				  String[] pricess = price.replace(",", "").split(" ");  
					// for 문돌며서 최저가검색
				  int minprice = Integer.MAX_VALUE;
				  for (int q = 0; q < pricess.length; q++) {

					  if (Integer.parseInt(pricess[q]) < minprice) {
							minprice = Integer.parseInt(pricess[q]);							
					  }
					}
				
				  String	minprices = minprice+"";										
				  WebElement imgss = driver.findElement(By.cssSelector("#baseImage"));
				  String img = imgss.getAttribute("src");	
										
				  List<WebElement> memorys = driver.findElements(By.cssSelector(".dsc a"));					
				  String memory = "";
					  
				  for(WebElement ele : memorys) {
						  lists.add(ele.getText());
					  }
					  
				  for(int l = 0 ; l < lists.size(); l++) {
					  if((lists.get(l)+"").contains("GB")){
							 memory = (lists.get(l)+"").replace("GB", ""); break;
					  }
				  }
					  					  					  
				  List<WebElement> usbs = driver.findElements(By.cssSelector(".dsc a"));
				  ArrayList listss = new ArrayList();
				  String usb = "";
					  
				  for(WebElement ele : usbs) {
					  	  lists.add(ele.getText());
					  }

				  for(int m = 0 ; m < lists.size(); m++) {
				  	  if((lists.get(m)+"").contains("총")){
				  		  usb = (lists.get(m)+"").replace("총", "").replace("개", ""); break;
				  	  }
				  }
					  
					  
					  
				  List<WebElement> uses = driver.findElements(By.cssSelector(".tit"));

				  ArrayList listsss = new ArrayList();
				  String purpose = "";
				  for(WebElement ele : uses) {
				  	  lists.add(ele.getText());
				  }

				  for(int n = 0 ; n < lists.size(); n++) {
				  	  if((lists.get(n)+"").contains("게임") || (lists.get(n)+"").contains("사무") || (lists.get(n)+"").contains("인강") || (lists.get(n)+"").contains("그래픽")){
				  		  purpose = (lists.get(n)+""); break;
				  	  }
				  }
				  
					  
					  
				  List<WebElement> Thicknesss = driver.findElements(By.cssSelector(".dsc a"));

				  ArrayList listssss = new ArrayList();
				  String thickness = "";
				  for(WebElement ele : Thicknesss) {
				  	  lists.add(ele.getText());
				  }

				  for(int o = 0 ; o < lists.size(); o++) {
				  	  if((lists.get(o)+"").contains("mm")){
				  		  thickness = (lists.get(o)+"").replace("mm", ""); break;
				  	  }
				  }
				  
				  List<WebElement> els =	driver.findElements(By.cssSelector(".items a"));
					
					String allinfo = "";	
					for (WebElement element : els) {
						allinfo+=element.getText();
									
								}
								  					  
				  NoteBookInfo bean = new NoteBookInfo(name,screeninch,weight,company,minprices,img,memory, usb,purpose,thickness,allinfo);				 
			
				  crawlingMapper.InsertNoteBook(bean);	
					  
			}
		}
	      
	      
	      
	}
		
	public List<NoteBookInfo> samSung(){
		return crawlingMapper.samSung();
	}
	
	public List<NoteBookInfo> renova(){
		return crawlingMapper.renova();
	}
	
	public List<NoteBookInfo> lg(){
		return crawlingMapper.lg();
	}
	
	}
	