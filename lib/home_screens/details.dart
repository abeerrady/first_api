import 'package:first_api/home_screens/model.dart';
import 'package:first_api/home_screens/person_data.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final ResponseData dataItem;

  const DetailsScreen({ this.dataItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Expanded(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (ctx) => PersonDataScreen(
                img: dataItem.img,
                name: dataItem.name,
                nickname: dataItem.nickname,
                birthday: dataItem.birthday,
                status: dataItem.status,
                occupation: dataItem.occupation,
                portrayed: dataItem.portrayed,
                category: dataItem.category,
              )
            ));
          },
          child: Expanded(
            child: Row(
              children: [
                Container(
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(dataItem.img ??
                            'https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(
                         dataItem.name ?? 'Walter White ',
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(
                             color: Colors.black,
                             fontSize: 20,
                             fontWeight: FontWeight.bold),
                       ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          dataItem.nickname ?? 'Heisenberg',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          dataItem.birthday ?? '09-07-1958',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
