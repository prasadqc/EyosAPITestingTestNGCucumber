@SmokeTest
Feature: My Store API services

  @SmokeTest
  Scenario Outline: Validate correct product details are retrieved when User entered valid product id
    Given Request with <BaseURI>, <X-RapidAPI-Key> and <Host>
    When get <URL> with parameter <ProductID>
    Then validate status code 200
    Then Valid product details are displayed as <ProductID>,<ProductName>,<Price>,<Manufacturer>,<Category>,<Description>,<Tags>

    Examples:
    |BaseURI|X-RapidAPI-Key|Host|ProductID|URL|ProductName|Price|Manufacturer|Category|Description|Tags|
    |https://my-store2.p.rapidapi.com/|   85ffde5187mshb79e95fd76a8362p1d392djsn85956d649909   |  my-store2.p.rapidapi.com  | "911051" | "catalog/product/"  | EYOSProduct1 | 100 | EYOS |  |  |  |

  @SmokeTest
  Scenario Outline: Validate product is not found when User entered blank product id
    Given Request with <BaseURI>, <X-RapidAPI-Key> and <Host>
    When get <URL> with parameter <ProductID>
    Then validate status code 404
    Then Validate <Message>

    Examples:
      |BaseURI|X-RapidAPI-Key|Host|ProductID|URL|Message|
      |https://my-store2.p.rapidapi.com/|   85ffde5187mshb79e95fd76a8362p1d392djsn85956d649909   |  my-store2.p.rapidapi.com  | "     "  | "catalog/product/"  | Endpoint '/catalog/product/' does not exist |

  @SmokeTest
  Scenario Outline: Validate product is not found when User entered special characters product id
    Given Request with <BaseURI>, <X-RapidAPI-Key> and <Host>
    When get <URL> with parameter <ProductID>
    Then validate status code 404
    Then Validate <Message>

    Examples:
      |BaseURI|X-RapidAPI-Key|Host|ProductID|URL|Message|
      |https://my-store2.p.rapidapi.com/|   85ffde5187mshb79e95fd76a8362p1d392djsn85956d649909   |  my-store2.p.rapidapi.com  | "%" | "catalog/product/"  | Product with ID % not found |

  @SmokeTest
  Scenario Outline: Validate Product is not retrieved when User entered invalid API Key
    Given Request with <BaseURI>, <X-RapidAPI-Key> and <Host>
    When get <URL> with parameter <ProductID>
    Then validate status code 403
    Then Validate <Message>

    Examples:
      |BaseURI|X-RapidAPI-Key|Host|ProductID|URL|Message|
      |https://my-store2.p.rapidapi.com/|   85ffde5187mshb79e95fd76a8362p1d392djsn85956d6499099   |  my-store2.p.rapidapi.com  | "911051" | "catalog/product/"  | You are not subscribed to this API. |