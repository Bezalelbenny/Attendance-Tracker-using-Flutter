import 'package:flutter/material.dart';

void main() {
  
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Colors.amber),
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

// HOME PAGE
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int total = 100;

  Map<String, Map<String, dynamic>> profile = {
  "Anu": {"course": "BCA", "attended":0, "year": 2027},
  "Mohan": {"course": "BSW", "attended":0, "year": 2028},
  "Arjun":{"course":"BCom","attended":0,"year":2027},
  "John":{"course":"BCA","attended":0,"year":2028},
  "mark":{"course":"BSW","attended":0,"year":2027}
};

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(title: Text("St.Joseph College"),backgroundColor: Colors.orangeAccent,centerTitle: true,),

    body: ListView(
  children: profile.entries.map((c) => Card(
    color:Colors.yellow,
    
    
      
    child: ListTile(
      leading: Icon(Icons.person,size:40),
      

      title: Text(c.key),

      subtitle: Text(
        "Attendance: ${c.value["attended"] / total * 100}%"
      ),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor:Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4
              ),

            ),
            onPressed: () {
              setState(() {
                if (c.value["attended"] < total) {
                  c.value["attended"]++;
                }
              });
            },
            child: Text("Present"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding:EdgeInsets.symmetric(
                horizontal: 8,
                vertical:4
              ),

            ),
            onPressed:(){setState((){if (c.value["attended"]> 0){c.value["attended"]--;}
            });},child:Text('Absent')),
        ],
        
      ),

      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Profile(
            c.key,
            "Attendance: ${c.value["attended"] / total * 100}%",
            c.value["course"],
            c.value["year"]
          )
        )
      ),

    
    ),
  )).toList(),
),
  );
}

// PROFILE PAGE
class Profile extends StatelessWidget {

  final name, attendance, course, year;
  

  Profile(this.name, this.attendance, this.course, this.year);

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(title: Text("Student Profile"),backgroundColor: Colors.orangeAccent,),

    body: Center(
    child: Container(
    width: 300,
  
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.yellow,
    borderRadius: BorderRadius.circular(10),
    ),
    
      
        child:Column(
          mainAxisSize: MainAxisSize.min,

          children: [
  Icon(Icons.person, size: 40),

  Text(name),

  Text("Course: $course"),
  Text("Year of Passing: $year"),

  SizedBox(
    width: double.infinity,
    child: Column(
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: double.parse(
                  attendance.split(": ")[1].replaceAll("%", "")
                ) / 100,
                color: Colors.green,
                backgroundColor: Colors.grey,
                strokeWidth: 6,
              ),
              Text(
                "${attendance.split(": ")[1]}",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        SizedBox(
          width:double.infinity,

          
            child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 4),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text("Back"),
            ),
          
        ),
      ],
    ),
  ),
],
            ),
            ),
              
            ),
        
          
        );
        
      
    

    
  
}
