
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wsta\_google\_maps

The purpose of this repository is to house the final and supporting
documents for moving the Winston-Salem Transit Authority bus maps into
the Google Transit Partners framework. Moving this data into google will
allow citizens of Winston-Salem to use googlemaps to learn more about
bus routes and consider public transit when planning their
transportation. Additionally, this allows google maps to be used for
analysis of the transportation system as a whole.

# Resources:

## WSTA

[Route
Overview](https://wstransit.com/bus-routes/)

## Google Transit Partners

[Definitions](https://developers.google.com/transit/gtfs/reference/#term-definitions)

[Examples](https://developers.google.com/transit/gtfs/examples/gtfs-feed)

[Testing
Environment](https://github.com/google/transitfeed/wiki/ScheduleViewer)

[feed
validator](https://github.com/google/transitfeed/wiki/FeedValidator)

[CARTA Chattanooga
System](http://www.gocarta.org/alt-flash/insidecarta.php#developers)

## Shape File Creator

<https://www.gmap-pedometer.com/>

# Repository Structure

    #>                             levelName
    #> 1  WSTA Transit                      
    #> 2   ¦--routes                        
    #> 3   ¦   °--Route GPX files           
    #> 4   ¦--references                    
    #> 5   ¦   ¦--Google Provided Examples  
    #> 6   ¦   °--Chattanooga CARTA Examples
    #> 7   ¦--src                           
    #> 8   ¦   °--Scripts to Generate Files 
    #> 9   °--out                           
    #> 10      °--Final Format Files
