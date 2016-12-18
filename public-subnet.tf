# Public Subnets
resource "aws_subnet" "main-public-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${data.aws_availability_zones.available.names[0]}"    
    tags {
        Name = "main-public-1"
    }
}
resource "aws_subnet" "main-public-2" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${data.aws_availability_zones.available.names[1]}"    

    tags {
        Name = "main-public-2"
    }
}
resource "aws_subnet" "main-public-3" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "172.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${data.aws_availability_zones.available.names[2]}"    

    tags {
        Name = "main-public-3"
    }
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "main"
    }
}

# route tables
resource "aws_route_table" "main-public" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.main-gw.id}"
    }

    tags {
        Name = "main-public-1"
    }
}

# route associations public
resource "aws_route_table_association" "main-public-1-a" {
    subnet_id = "${aws_subnet.main-public-1.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
resource "aws_route_table_association" "main-public-2-a" {
    subnet_id = "${aws_subnet.main-public-2.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
resource "aws_route_table_association" "main-public-3-a" {
    subnet_id = "${aws_subnet.main-public-3.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
