package com.walk2walk.demo;

public class Position {

    private double latitude;
    private double longitude;
    private String timestamp;

    public Position(double latitude, double longitude) {

        this.setLatitude(latitude);
        this.setLongitude(longitude);
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    @Override
    public String toString() {

        return "Moved to latitude:" + this.latitude + " longitude:" + this.longitude;
    }
}