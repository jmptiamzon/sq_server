const express = require('express');
const fs = require('fs');
const bodyParser = require('body-parser');
const app = express();
const mysqldump = require('mysqldump');
var nodemailer = require('nodemailer');
var ejs = require('ejs');
//const bcrypt = require('bcrypt');
//const saltRounds = 10;
// store config variables in dotenv
require('dotenv').config();
const cors = require('cors');

// ****** allow cross-origin requests code START ****** //
// http://localhost:4200 { origin: 'https://ceval-1053a.firebaseapp.com' }
app.use(cors()); // uncomment this to enable all CORS and delete cors(corsOptions) in below code
//app.use(bodyParser.urlencoded({extended:true}));
//app.engine('html', require('ejs').renderFile);


const allowedOrigins = process.env.allowedOrigins.split(',');

// ****** validation rules START ****** //
const valFunctions = require('./validators/validate');
// ****** validation rules END ****** //

// app Routes
// create application/json parser
const jsonParser = bodyParser.json();
// create application/x-www-form-urlencoded parser
const urlencodedParser = bodyParser.urlencoded({ extended: false });
 
// POST /login gets urlencoded bodies
app.post('/login', jsonParser, function (req, res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.loginUser(req,res);
});

app.post('/addAdmin', jsonParser, function (req, res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.addAdmin(req,res);
});

app.post('/addSchool', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.addSchool(req,res);
});

app.post('/addCourse', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.addCourse(req,res);
});

app.post('/addQuestion', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.addQuestion(req,res);
});

app.post('/addLinearTree', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.addLinearTree(req,res);
});

app.get('/getData', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getData(req,res);
});

app.get('/getDataArea', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getDataArea(req,res);
});

app.get('/getArea', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    dbFunctions.getDataArea(req,res);
});

app.get('/getDataSchool', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getDataSchool(req,res);
});

app.get('/getDataCourse', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getDataCourse(req,res);
});

app.get('/getDataQuestion', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getDataQuestion(req,res);
});

app.get('/getAppStatus', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getAppStatus(req,res);
});

app.get('/getUserLogs/:type', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getUserLogs(req,res);
});

app.get('/getCurrentUser/:id', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getCurrentUser(req,res);
});

app.post('/updateAdmin', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.updateAdmin(req,res);
});

app.post('/updateSchool', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.updateSchool(req,res);
});

app.post('/updateCourse', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.updateCourse(req,res);
});

app.post('/updateCurrentUser', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.updateCurrentUser(req,res);
});

app.post('/updateQuestion', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.updateQuestion(req,res);
});

app.get('/updateAppStatus/:status', jsonParser, function (req,res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.updateAppStatus(req,res);
});

app.get('/backupDB', jsonParser, function (req,res) {
    valFunctions.checkJWTToken(req,res);
    var logpath = process.env['HOME'] + '/Documents/dbceval.sql';

    mysqldump({
        connection: {
            host: 'us-cdbr-iron-east-05.cleardb.net',
            user: 'b77b8945ed1b4c',
            password: '992080b7',
            database: 'heroku_d35f42bafe87ee6',
        },
        dumpToFile: logpath,
    });
});

app.post('/backupTables', jsonParser, function (req,res) {
    valFunctions.checkJWTToken(req,res);
    var logpath = process.env['HOME'] + + '/Documents/dbceval.sql';

    mysqldump({
        connection: {
            host: 'us-cdbr-iron-east-05.cleardb.net',
            user: 'b77b8945ed1b4c',
            password: '992080b7',
            database: 'heroku_d35f42bafe87ee6',
        },
        dump: {
            tables: req.body.tables,
        },
        dumpToFile: logpath,
    });
});

app.get('/updateLogs/:id/:cond/:username/:userid', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.updateLogs(req,res);
});

app.get('/getAssessmentQuestions', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    dbFunctions.getAssessmentQuestions(req,res);
});

app.get('/getAssessmentCourse', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    dbFunctions.getAssessmentCourse(req,res);
});

app.get('/getAssessmentSchool', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    dbFunctions.getDataSchool(req,res);
});

app.post('/sendSurvey', jsonParser, function (req, res) {
    let transporter = nodemailer.createTransport({
        host: 'smtp.gmail.com',
        port: 465,
        secure: true,
        auth: {
            // should be replaced with real sender's account
            user: '',
            pass: ''
        }
    });

    ejs.renderFile(__dirname + '/template/mail.html', { visitor: req.body.visitor }, function (err, data) {
        if (err) {
            console.log(err);
        
        } else {
            let mailOptions = {
                // should be replaced with real recipient's account
                to: req.body.email,
                subject: 'Thank you for taking the assessment',
                html: data
            };
            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    return console.log(error);
                }
                console.log('Message %s sent: %s', info.messageId, info.response);
                res.send(true);
            });
        }
    });


});

app.post('/sendContact', jsonParser, function (req, res) {
    let transporter = nodemailer.createTransport({
        host: 'smtp.gmail.com',
        port: 465,
        secure: true,
        auth: {
            // should be replaced with real sender's account
            user: '',
            pass: ''
        }
    });

    ejs.renderFile(__dirname + '/template/contact.html', { from: req.body.email, body: req.body.content }, function (err, data) {
        if (err) {
            console.log(err);
        
        } else {
            let mailOptions = {
                // should be replaced with real recipient's account
                to: req.body.email,
                subject: req.body.subject,
                html: data
            };
            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    return console.log(error);
                }
                console.log('Message %s sent: %s', info.messageId, info.response);
                res.send(true);
            });
        }
    });


});

app.post('/addUser', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.addUser(req,res);
});

app.get('/getUserCount', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getUserCount(req,res);
});

app.get('/getAdminCount', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getAdminCount(req,res);
});

app.get('/getDbUpdate', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getDbUpdate(req,res);
});

app.get('/getUsers', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getUsers(req,res);
});

app.get('/getChosenSchool/:currYear', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getChosenSchool(req,res);
});

app.get('/getSuggestedCourse/:currYear', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getSuggestedCourse(req,res);
});

app.get('/getVisitors/:currYear', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getVisitors(req,res);
});

app.get('/getConversionCount/:currYear', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getConversionCount(req,res);
});

app.post('/adminExists', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.adminExists(req,res);
});

app.post('/addArea', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.addArea(req,res);
});

app.post('/updateArea', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.updateArea(req,res);
});

app.post('/areaExists', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.areaExists(req,res);
});

app.post('/schoolExists', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.schoolExists(req,res);
});

app.post('/courseExists', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.courseExists(req,res);
});

app.post('/questionExists', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.questionExists(req,res);
});

app.post('/addVisitor', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.addVisitor(req,res);
});

app.post('/addUserLog', jsonParser, function (req,res) {
    if(valFunctions.checkInputDataNULL(req,res)) return false;
    if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.updateLogs(req,res);
});

app.post('/addRank', jsonParser, function (req,res) {
    // if(valFunctions.checkInputDataNULL(req,res)) return false;
    // if(valFunctions.checkInputDataQuality(req,res)) return false;
    var dbFunctions = require('./models/connector');
    dbFunctions.addRank(req,res);
});

app.get('/getMaintenance', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    // valFunctions.checkJWTToken(req,res);
    dbFunctions.getAppStatus(req,res);
});

app.get('/getSurveyCourse', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    // valFunctions.checkJWTToken(req,res);
    dbFunctions.getDataCourse(req,res);
});

app.get('/getSurveySchool', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    // valFunctions.checkJWTToken(req,res);
    dbFunctions.getDataSchool(req,res);
});

app.post('/surveyExists', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    // valFunctions.checkJWTToken(req,res);
    dbFunctions.surveyExists(req,res);
});

app.post('/getVisitorToken', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    // valFunctions.checkJWTToken(req,res);
    dbFunctions.getVisitorToken(req,res);
});

app.post('/addSurvey', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    // valFunctions.checkJWTToken(req,res);
    dbFunctions.addSurvey(req,res);
});

app.get('/getTrees', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getTrees(req,res);
});

app.post('/deleteLinearTree', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.deleteLinearTree(req,res);
});

app.get('/getSurvey/:currYear', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getSurvey(req,res);
});

app.get('/getQuestionTree/:id', jsonParser, function (req, res) {
    var dbFunctions = require('./models/connector');
    valFunctions.checkJWTToken(req,res);
    dbFunctions.getQuestionTree(req,res);
});





/*
var test = "";
bcrypt.hash("Azkals03!", saltRounds, function(err, hash) {
    test = hash;
});*/

app.use('/', (req, res) => res.send('asdsa'));
app.listen(process.env.PORT, () => console.log('Test:' + process.env.PORT));