import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";

export async function GET() {
    try {
        const subscription = await prisma.subscription.findMany();

        return NextResponse.json(subscription);
    } catch (error) {
        console.error('Error fetching subscription:', error);
        return NextResponse.json({ error: 'Failed to fetch subscription' }, { status: 500 });
    }
}
