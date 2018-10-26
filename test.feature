# Posting Template Instance
# Read endpoints for retrieving reference-counts for acl-sets, interfaces, prefix-sets, class-maps, and policy-maps
# Decommission Template Instance
@templateInstance
Feature: Post Template Instance on NDS Read reference count

  Scenario Outline: Post template instance
    When I post template instance with <payload> to NDS endpoint
    Then I should get a <code> response and expected response as <payload>
    Examples:
    | payload             | code |
    | correct             | 200  |
    | missing_partner     | 400  |
    | wrong_variables     | 400  |
    | templateVersion     | 400  |


  Scenario Outline: Read from template instance
    When I read <params> from template instance using <endpoint> endpoint
    Then  I should get templateuuid for <params>

    Examples:
      | params      |                     endpoint                                                                             |
      | interfaces  | /nds/v1/devices/rur1.sebring.fl.westfl.testy.net/interfaces/Te0%2F2%2F0%2F20/references       |
      | acl-sets    | /nds/v1/devices/rur1.sebring.fl.westfl.testy.net/acl-sets/IPV4-PERMIT-ANY/references          |
      | prefix-sets | /nds/v1/devices/rur1.sebring.fl.westfl.testy.net/prefix-sets/dummy/references                 |
      | class-maps  | /nds/v1/devices/rur1.sebring.fl.westfl.testy.net/class-maps/IPV4-DEFAULT-TRAFFIC/references   |
      | policy-maps | /nds/v1/devices/rur1.sebring.fl.westfl.testy.net/policy-maps/EXT-MARK-DSCP0-OUT/references    |

  Scenario: Delete template Instance
    When I delete template instance using /nds/v2/serviceIds/uuid
    Then I should get 204 response
