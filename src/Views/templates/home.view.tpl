<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Funciones</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<table>
    <thead>
        <tr>
            <th>Codigo</th>
            <th>Descripcion</th>
            <th>Estado</th>
            <th>Tipo</th>
        </tr>
    </thead>
    <tbody>
        {{foreach products}}
        <tr>
            <td>{{fncod}}</td>
            <td>{{fndsc}}</td>
            <td>{{fnest}}</td>
            <td>{{fntyp}}</td>
        </tr>
        {{endfor products}}
    </tbody>
</table>
</html>
