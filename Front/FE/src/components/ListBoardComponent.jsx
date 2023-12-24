import React, { useState, useEffect } from 'react'
import axios from 'axios';

function TestComponent() {

    //const baseUrl = "http://3.37.138.101:8080"; //되는 코드
    const baseUrl = "http://localhost:8080"; //api를요청할 ip

    const [ data, setData ] = useState();

    useEffect(() => {
        putSpringData();
    },[])

    async function putSpringData() {
        await axios
        .get(baseUrl + "/api/board")
        .then((res)=>{
            console.log(res.data); 
            setData(res.data);
        })
        .catch((err)=>{
            console.log(err);
        })
    }

    return (
    <div>
    <h2 className="text-center">Boards List</h2>
        <div className="App">
                 
           <table className="table table-striped table-bordered">
         
                <thead>
                    <tr>
                        <th>글 번호</th>
                        <th>제목 </th>
                        <th>작성자 </th>
                        <th>내용 </th>
                        
                    </tr>
                </thead>

            <tbody>
                {data ? data.map((datas)=>(
                    <tr key={datas.no}>
                        <td> {datas.no}</td>
                        <td> {datas.title}</td>
                        <td>{datas.member_Id}</td>
                        <td>{datas.contents}</td>
                    </tr>
                )) : ''}
            </tbody>
           </table>
        </div>
         </div>
      );

}

export default TestComponent;