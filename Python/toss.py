#!/usr/bin/python3

# Autor  : Mirza Mahrab Hossain
# Email  : mahrjose.dev@gmail.com
# Github : github.com/Mahrjose/Scripts
# ========================================== #


import argparse
import random
import time


def toss(heads="HEADS", tails="TAILS"):
    choice = random.randint(0, 1)
    # if choice is 1 retrun heads else print tails
    result = heads if choice == 1 else tails
    print(f"\n{result}\n")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-hd", "--heads", help="Specify a name for 'HEADS'")
    parser.add_argument("-tl", "--tails", help="Specify a name for 'TAILS'")
    args = parser.parse_args()

    # delay 1s for suspence :3
    time.sleep(2)

    # if heads or tails any one option is given
    if args.heads or args.tails:
        # if both are given
        if args.heads and args.tails:
            toss(args.heads, args.tails)
        elif args.heads:
            toss(args.heads)
        else:
            toss(tails=args.tails)
    else:
        toss()


if __name__ == "__main__":
    main()
