from flask import Flask
app = Flask(__name__)

@app.route('/')
def available_routes():
    routes = """Welcome to the your next Hawaii Surf vacation!!!<br/>
    Visit the following pages to find the best weather for your next vacation:<br/>
    <br/>
    <b>/api/v1.0/precipitation</b> - View 12 months of precipitation from 9 weather stations in Hawaii<br/>
    <b>/api/v1.0/stations</b> - View the minimum, maximum, and average temperature for each weather station<br/>
    <b>/api/v1.0/tobs<b/> - Temperature data<br/>
    <b>/api/v1.0/[start]<b/> - View minimum, maximum, and average temperature for all dates starting with your [start] date<br/>
    <b>/api/v1.0/[start]/[end]<b/> - View minimum, maximum, and average temperature for all dates between your [start] and [end] date<br/>
    """

    return routes

if __name__ == '__main__':
    app.debug = True
    app.run(host = '0.0.0.0', port = 5000)