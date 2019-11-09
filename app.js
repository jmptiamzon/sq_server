const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const mysqldump = require('mysqldump');
var nodemailer = require('nodemailer');
//const bcrypt = require('bcrypt');
//const saltRounds = 10;
// store config variables in dotenv
require('dotenv').config();
const cors = require('cors');

// ****** allow cross-origin requests code START ****** //
// http://localhost:4200 { origin: 'https://ceval-1053a.firebaseapp.com' }
app.use(cors()); // uncomment this to enable all CORS and delete cors(corsOptions) in below code
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

app.get('/getUserLogs', jsonParser, function (req, res) {
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
    var home = require('os').homedir();
    var logpath = home + '/Documents/dbceval.sql';

    mysqldump({
        connection: {
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'dbceval',
        },
        dumpToFile: logpath,
    });
});

app.post('/backupTables', jsonParser, function (req,res) {
    valFunctions.checkJWTToken(req,res);
    var home = require('os').homedir();
    var logpath = home + '/Documents/dbceval.sql';

    mysqldump({
        connection: {
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'dbceval',
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
    dbFunctions.getAssessmentSchool(req,res);
});

app.get('/sendEmail', jsonParser, function (req, res) {
    let transporter = nodemailer.createTransport({
        host: 'smtp.gmail.com',
        port: 465,
        secure: true,
        auth: {
            // should be replaced with real sender's account
            user: 'jmptiamzon@gmail.com',
            pass: '45788670'
        }
    });
    let mailOptions = {
        // should be replaced with real recipient's account
        to: 'sexurfaffy@gmail.com',
        subject: 'test',
        text: 'test'
    };
    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            return console.log(error);
        }
        console.log('Message %s sent: %s', info.messageId, info.response);
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


/*
var test = "";
bcrypt.hash("Azkals03!", saltRounds, function(err, hash) {
    test = hash;
});*/

app.use('/', (req, res) => res.send('asdsa'));
app.listen(process.env.PORT, () => console.log('Test:' + process.env.PORT));