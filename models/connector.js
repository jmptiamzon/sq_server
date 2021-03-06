const pool = require('./dbconnection');
const bcrypt = require('bcryptjs');
// const saltRounds = 10;
const jwt = require('jsonwebtoken');
var string = require("string-sanitizer");

var resultsNotFound = {
    "errorCode": "0",
    "errorMessage": "Operation not successful.",
    "rowCount": "0",
    "token": "",
    "data": ""
};

var resultsFound = {
    "errorCode": "1",
    "errorMessage": "Operation successful.",
    "rowCount": "1",
    "token": "",
    "data": ""
};

module.exports = {
    loginUser: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
          var sql = 'SELECT * FROM tbladmin WHERE username = ? AND status = 1';
          var values = [req.body.uname]
          // Use the connection
          connection.query(sql, values, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
            bcrypt.compare(req.body.pword, results[0].password).then((result) => {
              if (result == true) {
                var token = {
                  "token": jwt.sign(
                    { user: req.body.uname },
                    process.env.JWT_SECRET,
                    { expiresIn: '1d' }
                  )
                }
                resultsFound["token"] = token;
                resultsFound["data"] = results;
                res.send(resultsFound);
              } else {
                resultsNotFound["errorMessage"] = "Incorrect Password.";
                return res.send(resultsNotFound);
              }
            });
  
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    }, 

    addAdmin: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!

        bcrypt.genSalt(10, function(err, salt) {
          bcrypt.hash(req.body.pword, salt, function (err, hash) {
            var sql = 'INSERT INTO tbladmin SET ?';
            var values = { 'firstname': req.body.fname, 'middlename': req.body.mname, 'lastname': req.body.lname, 'username': req.body.uname, 'password': hash }
            // Use the connection
            connection.query(sql, values, function (error, results, fields) {
              if (error) {
                resultsNotFound["errorMessage"] = "emailID already exists.";
                return res.send(resultsNotFound);
              } else {
                resultsFound["data"] = results;
                return res.send(resultsFound);
              } 
    
              // When done with the connection, release it.
              connection.release(); // Handle error after the release.
              if (error) throw error; // Don't use the connection here, it has been returned to the pool.
            });
          });

        });
  
      });
    },

    addSchool: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'INSERT INTO tblschool SET ?';
        var values = { 
          'school_name': req.body.sname, 
          'area_id': req.body.areaSelect,
          'min_tuition': req.body.mntuition, 
          'max_tuition': req.body.mxtuition 
        };
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    schoolExists: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'SELECT * FROM tblschool WHERE school_name = ?';
        var values = req.body.sname;
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    addCourse: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'INSERT INTO tblcourse SET ?';
        var values = { 'school_id': req.body.sid.toString(), 'course_name': req.body.cname };
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    courseExists: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'SELECT * FROM tblcourse WHERE course_name = ?';
        var values = req.body.cname;
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    addQuestion: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'INSERT INTO tblquestions SET ?';

        var values = { 
          'question': string.sanitize(req.body.question), 
          'course_id': req.body.course.toString() 
        };
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    questionExists: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'SELECT * FROM tblquestions WHERE question = ?';

        var values = req.body.question;
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    addLinearTree: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'INSERT INTO tblltree SET ?';
        var values = { 'school_id': req.body.schoolId, 'question_id': req.body.questionId };
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    getUserLogs: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
  
          var sql = 'SELECT * FROM tbllogs WHERE ?';
          var values = { 'user_type': req.params.type }
          // Use the connection
          connection.query(sql, values, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getData: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
  
          var sql = 'SELECT * FROM `tbladmin`';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getAppStatus: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
  
          var sql = 'SELECT * FROM tblappstatus WHERE id = 1';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getDataArea: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
  
          var sql = 'SELECT * FROM tblarea';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getDataSchool: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
  
          var sql = 'SELECT tblschool.id AS school_id, tblschool.area_id, tblarea.area, tblschool.school_name, tblschool.min_tuition, tblschool.max_tuition, tblschool.status FROM tblschool INNER JOIN tblarea ON tblschool.area_id = tblarea.id';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getDataCourse: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
  
          var sql = 'SELECT * FROM tblcourse';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getDataQuestion: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
  
          var sql = 'SELECT * FROM tblquestions';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getCurrentUser: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
  
          var sql = 'SELECT * FROM tbladmin WHERE ?';
          var values = { 'id': req.params.id };
          // Use the connection
          connection.query(sql, values, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },
    
    updateAdmin: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'UPDATE tbladmin SET ? WHERE id = ?';

        if(req.body.pword == '' || req.body.pword == null) {
          var values = { 
            'firstname': req.body.fname, 
            'middlename': req.body.mname, 
            'lastname': req.body.lname, 
            'username': req.body.uname,
            'status': req.body.status,
          }

          connection.query(sql, [values, req.body.id], function(error, results, fields){
            if (error) { 
              console.log(error);
              resultsNotFound["errorMessage"] = "Data is NOT updated.";
              return res.send(resultsNotFound);

            } else {
              return res.send(resultsFound);
            }
            
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
    
        } else {
          bcrypt.genSalt(10, function(err, salt) {
            bcrypt.hash(req.body.pword, salt, function(err, hash) {
              var values = { 
                'firstname': req.body.fname, 
                'middlename': req.body.mname, 
                'lastname': req.body.lname, 
                'username': req.body.uname,
                'password': hash,
                'status': req.body.status,
              }
  
              connection.query(sql, [values, req.body.id], function(error, results, fields){
                if (error) { 
                  console.log(error);
                  resultsNotFound["errorMessage"] = "Data is NOT updated.";
                  return res.send(resultsNotFound);
    
                } else {
                  return res.send(resultsFound);
                }
  
                connection.release(); // Handle error after the release.
                if (error) throw error; // Don't use the connection here, it has been returned to the pool.
              });
  
            });

          });
        }
      });
    },

    updateCurrentUser: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'UPDATE tbladmin SET ? WHERE id = ?';

        if(req.body.pword == '' || req.body.pword == null) {
          var values = { 
            'firstname': req.body.fname, 
            'middlename': req.body.mname, 
            'lastname': req.body.lname, 
            'username': req.body.uname,
          }

          connection.query(sql, [values, req.body.id], function(error, results, fields){
            if (error) { 
              console.log(error);
              resultsNotFound["errorMessage"] = "Data is NOT updated.";
              return res.send(resultsNotFound);

            } else {
              return res.send(resultsFound);
            }
            
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
    
        } else {  
          bcrypt.genSalt(10, function(err, hash) {

            bcrypt.hash(req.body.pword, hash, function(err, hash) {
              var values = { 
                'firstname': req.body.fname, 
                'middlename': req.body.mname, 
                'lastname': req.body.lname, 
                'username': req.body.uname,
                'password': hash,
              }
  
              connection.query(sql, [values, req.body.id], function(error, results, fields){
                if (error) { 
                  console.log(error);
                  resultsNotFound["errorMessage"] = "Data is NOT updated.";
                  return res.send(resultsNotFound);
    
                } else {
                  return res.send(resultsFound);
                }
  
                connection.release(); // Handle error after the release.
                if (error) throw error; // Don't use the connection here, it has been returned to the pool.
              });
  
            });

          });
        }
      });
    },

    updateSchool: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'UPDATE tblschool SET ? WHERE id = ?';

        var values = { 
          'school_name': req.body.sname, 
          'area_id': req.body.areaSelect,
          'min_tuition': req.body.mntuition, 
          'max_tuition': req.body.mxtuition, 
          'status': req.body.status,
        }

        connection.query(sql, [values, req.body.id], function(error, results, fields){
          if (error) { 
            console.log(error);
            resultsNotFound["errorMessage"] = "Data is NOT updated.";
            return res.send(resultsNotFound);

          } else {
            return res.send(resultsFound);
          }
            
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    updateArea: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'UPDATE tblarea SET ? WHERE id = ?';
        var values = {
          'area': req.body.area, 
          'status': req.body.status === true ? 1 : 0
        };

        connection.query(sql, [values, req.body.id], function(error, results, fields){
          if (error) { 
            console.log(error);
            resultsNotFound["errorMessage"] = "Data is NOT updated.";
            return res.send(resultsNotFound);

          } else {
            return res.send(resultsFound);
          }
            
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    updateAppStatus: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'UPDATE tblappstatus SET ? WHERE id = 1';
        var values = {'status': req.params.status === 'true' ? 1 : 0};

        connection.query(sql, values, function(error, results, fields){
          if (error) { 
            console.log(error);
            resultsNotFound["errorMessage"] = "Data is NOT updated.";
            return res.send(resultsNotFound);

          } else {
            return res.send(resultsFound);
          }
            
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    updateQuestion: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'UPDATE tblquestions SET ? WHERE id = ?';

        var values = { 
          'question': req.body.question, 
          'course_id': req.body.course.toString(), 
          'status': req.body.status,
        }

        connection.query(sql, [values, req.body.id], function(error, results, fields){
          if (error) { 
            console.log(error);
            resultsNotFound["errorMessage"] = "Data is NOT updated.";
            return res.send(resultsNotFound);

          } else {
            return res.send(resultsFound);
          }
            
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    updateLogs: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'INSERT INTO tbllogs SET ?';
          var values = '';
          if (req.params.cond == 0) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' successfully logged in.', 
              'user_type': 0 
            };

          } else if (req.params.cond == 1) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' added a new administrator user.', 
              'user_type': 0 
            };

          } else if (req.params.cond == 2) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' updated administrator user with id ' + req.params.id + '.',
              'user_type': 0 
            };

          } else if (req.params.cond == 3) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' added a new school data.',
              'user_type': 0 
            };

          } else if (req.params.cond == 4) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' updated a school data with id ' + req.params.id + '.',
              'user_type': 0 
            };

          } else if (req.params.cond == 5) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' added a new course.',
              'user_type': 0 
            };

          } else if (req.params.cond == 6) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' updated a course with id ' + req.params.id + '.',
              'user_type': 0 
            };

          } else if (req.params.cond == 7) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' changed the application status.',
              'user_type': 0 
            };

          } else if (req.params.cond == 8) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' created a database backup.',
              'user_type': 0 
            };

          } else if (req.params.cond == 9) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' created a database table backup.',
              'user_type': 0 
            };

          } else if (req.params.cond == 10) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' updated own account.',
              'user_type': 0 
            };

          } else if (req.params.cond == 11) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' logged off.',
              'user_type': 0 
            };

          } else if (req.params.cond == 12) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' added a new question.',
              'user_type': 0 
            };

          } else if (req.params.cond == 13) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' updated a question with id ' + req.params.id + '.',
              'user_type': 0 
            };

          } else if (req.body.log == 14) {
            values = { 
              'user': req.body.user_id, 
              'msg_log': 'User ' + req.body.name + ' went to home page.',
              'user_type': 1
            };

          } else if (req.body.log == 15) {
            values = { 
              'user': req.body.user_id, 
              'msg_log': 'User ' + req.body.name + ' went to about page.',
              'user_type': 1
            };

          } else if (req.body.log == 16) {
            values = { 
              'user': req.body.user_id, 
              'msg_log': 'User ' + req.body.name + ' went to feature page.',
              'user_type': 1
            };

          } else if (req.body.log == 17) {
            values = { 
              'user': req.body.user_id, 
              'msg_log': 'User ' + req.body.name + ' went to assessment page.',
              'user_type': 1
            };

          } else if (req.body.log == 18) {
            values = { 
              'user': req.body.user_id, 
              'msg_log': 'User ' + req.body.name + ' submitted the initial assessment.',
              'user_type': 1
            };

          } else if (req.body.log == 19) {
            values = { 
              'user': req.body.user_id, 
              'msg_log': 'User ' + req.body.name + ' submitted the mid assessment.',
              'user_type': 1
            };

          } else if (req.body.log == 20) {
            values = { 
              'user': req.body.user_id, 
              'msg_log': 'User ' + req.body.name + ' submitted the whole assessment.',
              'user_type': 1
            };

          } else if (req.params.cond == 21) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' added a new area.',
              'user_type': 0 
            };

          } else if (req.params.cond == 22) {
            values = { 
              'user': req.params.userid, 
              'msg_log': req.params.username + ' updated an area with id ' + req.params.id + '.',
              'user_type': 0 
            };

          } 



          // Use the connection
          connection.query(sql, values, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getAssessmentQuestions: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT * FROM tblltree INNER JOIN tblquestions ON tblltree.question_id = tblquestions.id INNER JOIN tblschool ON tblltree.school_id = tblschool.id';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getAssessmentCourse: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT * FROM tblcourse';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getAssessmentSchool: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT * FROM tblltree INNER JOIN tblschool ON tblschool.id = tblltree.school_id INNER JOIN tblarea ON tblschool.area_id = tblarea.id GROUP BY school_id';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            // console.log(results);
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getQuestionTree: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT * FROM tblltree INNER JOIN tblquestions ON tblquestions.id = tblltree.question_id WHERE school_id = ?';
          // Use the connection
          connection.query(sql, req.params.id, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            console.log(results);
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    addUser: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'INSERT INTO tblusers SET ?';
        var values = { 
          'visitor_id': req.body.visitor_id,
          'full_name': req.body.fname, 
          'gender': req.body.gender, 
          'age': req.body.age,
          'email': req.body.email, 
          'annual_income': req.body.income,
          'area_id': req.body.areaSelect,
          'first_course': req.body.courseChoice
        };
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    addArea: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'INSERT INTO tblarea SET ?';
        var values = { 
          'area': req.body.area
        };
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    updateCourse: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'UPDATE tblcourse SET ? WHERE id = ?';

        var values = { 
          'area': req.body.area, 
          'status': req.body.status,
        }

        connection.query(sql, [values, req.body.id], function(error, results, fields){
          if (error) { 
            console.log(error);
            resultsNotFound["errorMessage"] = "Data is NOT updated.";
            return res.send(resultsNotFound);

          } else {
            return res.send(resultsFound);
          }
            
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    areaExists: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!

          var sql = 'SELECT * FROM tblarea WHERE area = ?';
          
          var values = req.body.area;
          // Use the connection
          connection.query(sql, values, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "emailID already exists.";
              return res.send(resultsNotFound);
            } else {
              resultsFound["data"] = results;
              return res.send(resultsFound);
            } 
  
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
           });
        });
  
    },

    adminExists: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!

          var sql = 'SELECT * FROM tbladmin WHERE firstname = ? AND middlename = ? AND lastname = ? OR username = ?';
          
          var values = [ 
            req.body.fname, 
            req.body.mname, 
            req.body.lname, 
            req.body.uname
          ];
          // Use the connection
          connection.query(sql, values, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "emailID already exists.";
              return res.send(resultsNotFound);
            } else {
              resultsFound["data"] = results;
              return res.send(resultsFound);
            } 
  
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
           });
        });
  
    },

    getUserCount: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT COUNT(1) AS count FROM tblusers';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getAdminCount: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT COUNT(1) AS count FROM tbladmin';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getDbUpdate: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT * FROM tbldbbackup WHERE id = 1';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getUsers: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT * FROM tblusers';
          // Use the connection
          connection.query(sql, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getChosenSchool: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT * FROM tblcourserank INNER JOIN tblschool ON tblschool.id = tblcourserank.school_id WHERE YEAR(tblcourserank.created_at) = ? GROUP BY user_id';
          var value = req.params.currYear;
          // Use the connection
          connection.query(sql, value, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getSuggestedCourse: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT * FROM tblcourserank INNER JOIN tblcourse ON tblcourse.id = tblcourserank.course_id GROUP BY user_id, course_id';
          var value = req.params.currYear;
          // Use the connection
          connection.query(sql, value, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getConversionCount: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
          var sql = 'SELECT (SELECT COUNT(*) FROM tblvisitors WHERE YEAR(created_at) = ?) as tbl1, (SELECT COUNT(*) FROM tblusers WHERE YEAR(created_at) = ?) as tbl2';
          // Use the connection
          connection.query(sql, [req.params.currYear, req.params.currYear], function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }
          
            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getVisitors: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
          var sql = 'SELECT * FROM tblvisitors WHERE YEAR(created_at) = ?';
          var value = req.params.currYear;
          // Use the connection
          connection.query(sql, value, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    addVisitor: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'INSERT INTO tblvisitors SET ?';
        var values = { 'user_token': req.body.item };
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    deleteLinearTree: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'DELETE FROM tblltree WHERE id = ?';
        var values = req.body.question_id;
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    addRank: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'INSERT INTO tblcourserank SET ?';
        var values = { 
          'user_id': req.body.userId,
          'rank': req.body.rank,
          'course_id': req.body.course_id, 
          'school_id': req.body.school_id
        };
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    addSurvey: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'INSERT INTO tblsurvey SET ?';
        var values = {};

        if (req.body.cond == 1) {
          values = {
            'user_id': req.body.id,
            'school_name': req.body.schoolEnroll,
            'course_name': req.body.courseEnroll,
          };
        } else if (req.body.cond == 2) {
          values = {
            'user_id': req.body.id,
            'school_name': req.body.schoolEnroll,
            'course_name': req.body.otherCourse,
          };
        } else if (req.body.cond == 3) {
          values = {
            'user_id': req.body.id,
            'school_name': req.body.otherSchool,
            'course_name': req.body.courseEnroll,
          };
        } else if (req.body.cond == 4) {
          values = {
            'user_id': req.body.id,
            'school_name': req.body.otherSchool,
            'course_name': req.body.otherCourse,
          };
        }
        // Use the connection
        connection.query(sql, values, function (error, results, fields) {
          if (error) {
            resultsNotFound["errorMessage"] = "emailID already exists.";
            return res.send(resultsNotFound);
          } else {
            resultsFound["data"] = results;
            return res.send(resultsFound);
          } 
  
          // When done with the connection, release it.
          connection.release(); // Handle error after the release.
          if (error) throw error; // Don't use the connection here, it has been returned to the pool.
        });
      });
    },

    getVisitorToken: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        
          var sql = 'SELECT tblusers.id AS user_id FROM tblvisitors INNER JOIN tblusers ON tblvisitors.id = tblusers.visitor_id WHERE user_token = ?';
          var values = req.body.user_token;
          // Use the connection
          connection.query(sql, values, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    surveyExists: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
          var sql = 'SELECT * FROM tblsurvey WHERE user_id = ?';
          var value = req.body.user_id;
          // Use the connection
          connection.query(sql, value, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getTrees: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
          var sql = 'SELECT tblltree.id AS tree_id, tblschool.id AS school_id, tblschool.school_name, tblquestions.id AS question_id, tblquestions.question FROM tblltree INNER JOIN tblschool ON tblschool.id = tblltree.school_id INNER JOIN tblquestions ON tblquestions.id = tblltree.question_id';
          var value = req.params.currYear;
          // Use the connection
          connection.query(sql, value, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },

    getSurvey: function(req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
          var sql = 'SELECT * FROM tblsurvey WHERE YEAR(created_at) = ?';
          var value = req.params.currYear;
          // Use the connection
          connection.query(sql, value, function (error, results, fields) {
            if (error) {
              resultsNotFound["errorMessage"] = "Something went wrong with Server.";
              return res.send(resultsNotFound);
            }
            if (results =="") {
              resultsNotFound["errorMessage"] = "User Id not found.";
              return res.send(resultsNotFound);
            }

            resultsFound["data"] = results;
            res.send(resultsFound);
            // When done with the connection, release it.
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
        });
    },
};