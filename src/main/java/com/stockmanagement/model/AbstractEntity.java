package com.stockmanagement.model;

public abstract class AbstractEntity {
    protected String id;

    public AbstractEntity(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public abstract String toFileString();

}
