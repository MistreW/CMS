package gov.mof.CMS.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
public class FixedAsset {
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Integer id;

private String assetName;
private String model;
@DateTimeFormat(pattern="yyyy-MM-dd")
private LocalDate dateOfPurchase;
private Float purchaseCost;
private Float assetLife;
private Boolean linearDepreciation;
private Float residualValue;
private Boolean active;

public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getAssetName() {
	return assetName;
}
public void setAssetName(String assetName) {
	this.assetName = assetName;
}
public String getModel() {
	return model;
}
public void setModel(String model) {
	this.model = model;
}
public LocalDate getDateOfPurchase() {
	return dateOfPurchase;
}
public void setDateOfPurchase(LocalDate dateOfPurchase) {
	this.dateOfPurchase = dateOfPurchase;
}
public Float getPurchaseCost() {
	return purchaseCost;
}
public void setPurchaseCost(Float purchaseCost) {
	this.purchaseCost = purchaseCost;
}
public Float getAssetLife() {
	return assetLife;
}
public void setAssetLife(Float assetLife) {
	this.assetLife = assetLife;
}
public Boolean getLinearDepreciation() {
	return linearDepreciation;
}
public void setLinearDepreciation(Boolean linearDepreciation) {
	this.linearDepreciation = linearDepreciation;
}
public Float getResidualValue() {
	return residualValue;
}
public void setResidualValue(Float residualValue) {
	this.residualValue = residualValue;
}
public Boolean getActive() {
	return active;
}
public void setActive(Boolean active) {
	this.active = active;
}
@Override
public String toString() {
	return "FixedAsset [id=" + id + ", assetName=" + assetName + ", model=" + model + ", dateOfPurchase="
			+ dateOfPurchase + ", purchaseCost=" + purchaseCost + ", assetLife=" + assetLife + ", linearDepreciation="
			+ linearDepreciation + ", residualValue=" + residualValue + ", active=" + active + "]";
}





}
