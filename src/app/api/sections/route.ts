import { NextResponse } from "next/server";
import { prisma } from "@/app/libs/prisma";


export async function GET() {
    try {
        const section = await prisma.section.findMany();

        return NextResponse.json(section);
    } catch (error) {
        console.error('Error fetching section', error);
        return NextResponse.json({ error: 'Faild to fetch section' }, { status: 500 })
    }
}