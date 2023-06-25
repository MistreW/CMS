package gov.mof.CMS.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Users {
private static final long PASSWORD_EXPIRATION_TIME= 30L * 24L * 60L * 60L * 1000L;  
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Integer userId;

private String firstName;
private String LastName;
private String userName;

@ManyToOne
@JoinColumn(name="roleId",insertable =false,updatable=false)
private Roles role;
private Integer roleId;

private String position;
private String password;
@Column(name = "password_changed_time")
private Date passwordChangedTime;

private Boolean isActive;

public Integer getUserId() {
	return userId;
}
public void setUserId(Integer userId) {
	this.userId = userId;
}
public Roles getRole() {
	return role;
}
public void setRole(Roles role) {
	this.role = role;
}
public Integer getRoleId() {
	return roleId;
}
public void setRoleId(Integer roleId) {
	this.roleId = roleId;
}
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return LastName;
}
public void setLastName(String lastName) {
	LastName = lastName;
}
public String getPosition() {
	return position;
}
public void setPosition(String position) {
	this.position = position;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

public void setPasswordChangedTime(Date time){
	this.passwordChangedTime=time;
}
public Date getPasswordChangedTime(){
	return passwordChangedTime;
}

public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public Boolean getIsActive() {
	return isActive;
}
public void setIsActive(Boolean isActive) {
	this.isActive = isActive;
}



public boolean isPasswordExpired() {
	if (this.passwordChangedTime == null) return false;
	 
	long currentTime = System.currentTimeMillis();
	long lastChangedTime = this.passwordChangedTime.getTime();
	 
	return currentTime > lastChangedTime + PASSWORD_EXPIRATION_TIME;
}
@Override
public String toString() {
	return "Users [userId=" + userId + ", firstName=" + firstName + ", LastName=" + LastName + ", userName=" + userName
			+ ", role=" + role + ", roleId=" + roleId + ", position=" + position + ", password=" + password
			+ ", isActive=" + isActive + "]";
}


}
