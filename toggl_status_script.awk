BEGIN {
    first_line = 1;
}
{
    if (first_line == 1) {
        first_line = 0
        $NF=""
        g["description"] = $0
    }
    if ($1 == "Project:") {
        $1="";
        $NF="";
        g["project"] = $0;
    }
    if ($1 == "Duration:") {
        g["duration"] = $2;
    }
}
END {
    if (g["description"] == "") {
        g["description"] = "(empty)"
    }
    print(g["description"], "-",  g["project"], "-", g["duration"])
}
