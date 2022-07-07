| **Category** | **SLI**                                                                              | **SLO**                                                                                                     |  |
|--------------|--------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|-------------------|
| Availability | The total number of successful requests divided by the total number of all requests. | 99%                                                                                                         |                   |
| Latency      | 90% percentile of all requests complete in less or equal to 100ms.                   | 90% of requests below 100ms                                                                                 |                   |
| Error budget | The total number of error requests divided by the total number of all requests.      | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |                   |
| Throughput   | The total number of requests divived by the time interval in seconds.                | 5 RPS indicates the application is functioning                                                              |                   |

