const pool = require('./dbconnection');
const bcrypt = require('bcryptjs');
// const saltRounds = 10;
const jwt = require('jsonwebtoken');

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
      console.log(req);
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
          var sql = 'SELECT * FROM tbladmin WHERE username = ?';
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
        var values = { 'school_name': req.body.sname, 'min_tuition': req.body.mntuition, 'max_tuition': req.body.mxtuition }
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
        var values = { 'school_id': req.body.sid.toString(), 'course_name': req.body.cname }
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

        var values = { 'question': req.body.question, 'course_id': req.body.course.toString() }
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
        var values = { 'school_id': req.body.schoolId, 'question_id': req.body.questionId }
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
  
          var sql = 'SELECT * FROM tbllogs';
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

    getDataSchool: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
  
          var sql = 'SELECT * FROM tblschool';
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
            bcrypt.hash(req.body.pword, saltRounds, function(err, hash) {
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
              console.log(results);
              return res.send(resultsFound);
            }
            
            connection.release(); // Handle error after the release.
            if (error) throw error; // Don't use the connection here, it has been returned to the pool.
          });
    
        } else {  
          bcrypt.genSalt(10, function(err, hash) {

            bcrypt.hash(req.body.pword, saltRounds, function(err, hash) {
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
                  console.log(results);
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

    updateCourse: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'UPDATE tblcourse SET ? WHERE id = ?';

        var values = { 
          'school_id': req.body.sid.toString(), 
          'course_name': req.body.cname, 
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
        
          var sql = 'SELECT * FROM tblschool';
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

    addUser: function (req, res) {
      pool.getConnection(function (err, connection) {
        if (err) throw err; // not connected!
        var sql = 'INSERT INTO tblusers SET ?';
        var values = { 
          'full_name': req.body.fname, 
          'gender': req.body.gender, 
          'age': req.body.age,
          'email': req.body.email, 
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
};