package gov.mof.CMS.dto;

public class SalesDto implements Comparable<SalesDto>{
private Double foodCount;
private String foodName;
public SalesDto(String foodName,Double foodCount) {
	super();
	this.foodCount = foodCount;
	this.foodName = foodName;
}
public Double getFoodCount() {
	return foodCount;
}
public void setFoodCount(Double foodCount) {
	this.foodCount = foodCount;
}
public String getFoodName() {
	return foodName;
}
public void setFoodName(String foodName) {
	this.foodName = foodName;
}
@Override
public int compareTo(SalesDto o) {
	int x=0;
	if (this.foodCount-o.foodCount>0)
		x=-1;
	if (this.foodCount-o.foodCount==0)
		x=0;
	if (this.foodCount-o.foodCount<0)
		x=1;
	
	return x;
}


}
