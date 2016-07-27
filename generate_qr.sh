while [[ $# != 0 ]]; do
    wget -cO "$1.png" "https://chart.googleapis.com/chart?chs=300x300&cht=qr&choe=UTF-8&chl=$2"
    shift; shift
done
