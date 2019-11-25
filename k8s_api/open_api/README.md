
[ref](https://www.youtube.com/watch?v=6kwmW_p_Tig)
[OpenAPI Specification 3.0](https://www.slideshare.net/smartbear_software/openapi-30-and-what-it-means-for-the-future-of-swagger)


Reusable Parameters -
- Query (users?id=3)
- Path (users/tan.alam)
- Header (X-customeheader=23)
- Cookies (cookie: debug=0)

- RequestBody
- Further serialization support by defining media types

---

Example : 
- **Objective**: Design an API that allows users to obtain information for employees, or post information of new employee in compnay DB.
- **Team** - 
  - API Designer
  - API Documentation
  - API Development

Planning:

##### Resource: Employee

- **GET** : Gives info for array of employees.
  - Query Parameters:
    - bodyLimit
    - pageLimit
  - Responses
    - 200 Payload
      - ID
      - Name
      - Title

- **GET** : Gives info for specific employee
  - Path Parameters
    - ID
  - Responses
    - 200 Payload
      - ID
      - Name
      - Title

- **POST** : Allows posting infor of new employee
  - Parameters:
    - Payload
      - ID
      - Name
      - Title
  - Responses
    - 200
    
    
    
**SwaggerHub** - is the API design and documentation platform built for teams to drive consistency and discipline across their API development workflow.

https://app.swaggerhub.com/apis/tanalam2411/HR_API_OAS3.0/2.0.0          


