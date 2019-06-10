from flask import Flask, request, flash, render_template, g
from wtforms import Form, TextField, TextAreaField, validators, StringField, SubmitField

app = Flask(__name__)
app.config.from_object(__name__)
app.config['SECRET_KEY'] = '7d441f27d441f27567d441f2b6176a'


start = '9999-12-31'
end = '9999-12-31'

class DateForm (Form):

    start = StringField('Start Date:', [validators.InputRequired()])
    end = StringField('End Date:', [validators.InputRequired()])

def get_start(value):
    db = getattr(g, 'start', None)
    if db is None:
        db = g.start = value
    return db

def get_end(value):
    db = getattr(g, 'end', None)
    if db is None:
        db = g.end = value
    return db


routes = """<br/>
Visit the following pages to find the best weather for your next vacation:<br/>
<br/>
<b>/api/v1.0/precipitation</b> - View 12 months of precipitation from 9 weather stations in Hawaii<br/>
<b>/api/v1.0/stations</b> - View the minimum, maximum, and average temperature for each weather station<br/>
<b>/api/v1.0/temperature<b/> - Temperature data<br/>
<b>/api/v1.0/starttrip<b/> - Historic min, max, and avg temperature for all dates after your trip starts<br/>
<b>/api/v1.0/wholetrip<b/> - Historic min, max, and avg temperature for the duration of your trip<br/>
"""


@app.route('/', methods=['GET', 'POST'])
def available_routes():
    global start
    global end

    form = DateForm(request.form)

    print(form.errors)
    if request.method == 'POST':
        startdate = request.form['start']
        enddate = request.form['end']
        print(startdate, " ", enddate)

        if form.validate():
            # Save the comment here.
            flash("Great! You're trip runs from "+startdate+" through "+enddate+"!<br/>"+routes)
            start = get_start(start)
            end = get_end(end)
        else:
            flash('Error: All the form fields are required.')

    return render_template('./surf_app.html', form=form)


@app.route('/api/v1.0/precipitation')
def precipitation():
    return "Hello Precipitation!"


@app.route('/api/v1.0/stations')
def stations():
    return "Hello Stations!"


@app.route('/api/v1.0/temperature')
def temperature():
    return "Hello Temperature!"


@app.route('/api/v1.0/starttrip')
#start = getattr(g, 'start')
def start_only():
    global start
    startdate = get_start(start)
    return "Start Date is " + startdate


@app.route('/api/v1.0/wholetrip')
def start_end(start, end):
    return "Start Date is " + g.start + " and the End Date is " + g.end


if __name__ == '__main__':
    app.debug = True
    app.run(host = '0.0.0.0', port = 5000)