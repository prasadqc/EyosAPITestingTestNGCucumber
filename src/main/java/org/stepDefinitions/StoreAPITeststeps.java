package org.stepDefinitions;

import io.cucumber.java.*;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;


import java.lang.reflect.Type;

import static io.restassured.RestAssured.given;
import static io.restassured.RestAssured.when;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.equalTo;


public class StoreAPITeststeps {
    Response response;

    RequestSpecification requestSpecification= RestAssured.given();

    @Given("^Request with (.+), (.+) and (.+)$")
    public void user_with_key_call_get_on_my_store2_p_rapidapi_com(String baseUri,String key,String host) {
        requestSpecification.baseUri(baseUri).header("X-RapidAPI-Key",key).header("Host",host).header("Accept","*/*");

    }
    @When("get {string} with parameter {string}")
    public void call_url_with_parameter_valid(String url,String productId) {
        response=requestSpecification.when().get(url+productId);
    }
    @Then("^Valid product details are displayed as (.+),(.+),(.+),(.+),([^\"]*),([^\"]*),([^\"]*)$")
    public void poduct_id_eyos_product1_eyos(String productId,String productName,Integer price,String manufacturer,String category,String description,String tags) {
        response.then()
                .body("id", equalTo(Integer.parseInt(productId.replace("\"",""))))
                .body("name", containsString(productName))
                .body("description", containsString(description))
                .body("manufacturer", containsString(manufacturer))
                .body("category", containsString(category))
                .body("price", equalTo(price))
                .body("tags", containsString(tags));
    }

    @Then("validate status code {int}")
    public void validate_status_code(Integer statusCode) {
        response.then().statusCode(equalTo(statusCode));
    }
    @Then("^Validate (.+)$")
    public void validate_product_with_id_not_found(String message) {
        response.then().body("message", containsString(message));
    }
}
