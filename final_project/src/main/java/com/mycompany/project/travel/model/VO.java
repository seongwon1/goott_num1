package com.mycompany.project.travel.model;

public class VO {
	String location_name;
	String address;
	String parking;
	String publictransport;
	String wheelchair;
	String elevator;
	String braileblock;
	String helpdog;
	String guidehuman;
	String brailepromotion;
	String blindhandicapetc;
	String signguide;
	String videoguide;
	String hearinghandicapetc;
	String firstimage;
	String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getPublictransport() {
		return publictransport;
	}
	public void setPublictransport(String publictransport) {
		this.publictransport = publictransport;
	}
	public String getWheelchair() {
		return wheelchair;
	}
	public void setWheelchair(String wheelchair) {
		this.wheelchair = wheelchair;
	}
	public String getElevator() {
		return elevator;
	}
	public void setElevator(String elevator) {
		this.elevator = elevator;
	}
	public String getBraileblock() {
		return braileblock;
	}
	public void setBraileblock(String braileblock) {
		this.braileblock = braileblock;
	}
	public String getHelpdog() {
		return helpdog;
	}
	public void setHelpdog(String helpdog) {
		this.helpdog = helpdog;
	}
	public String getGuidehuman() {
		return guidehuman;
	}
	public void setGuidehuman(String guidehuman) {
		this.guidehuman = guidehuman;
	}
	public String getBrailepromotion() {
		return brailepromotion;
	}
	public void setBrailepromotion(String brailepromotion) {
		this.brailepromotion = brailepromotion;
	}
	public String getBlindhandicapetc() {
		return blindhandicapetc;
	}
	public void setBlindhandicapetc(String blindhandicapetc) {
		this.blindhandicapetc = blindhandicapetc;
	}
	public String getSignguide() {
		return signguide;
	}
	public void setSignguide(String signguide) {
		this.signguide = signguide;
	}
	public String getVideoguide() {
		return videoguide;
	}
	public void setVideoguide(String videoguide) {
		this.videoguide = videoguide;
	}
	public String getHearinghandicapetc() {
		return hearinghandicapetc;
	}
	public void setHearinghandicapetc(String hearinghandicapetc) {
		this.hearinghandicapetc = hearinghandicapetc;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	
	@Override
	public String toString() {
		return "VO [location_name=" + location_name + ", address=" + address + ", parking=" + parking
				+ ", publictransport=" + publictransport + ", wheelchair=" + wheelchair + ", elevator=" + elevator
				+ ", braileblock=" + braileblock + ", helpdog=" + helpdog + ", guidehuman=" + guidehuman
				+ ", brailepromotion=" + brailepromotion + ", blindhandicapetc=" + blindhandicapetc + ", signguide="
				+ signguide + ", videoguide=" + videoguide + ", hearinghandicapetc=" + hearinghandicapetc
				+ ", firstimage=" + firstimage + "]";
	}
}
