import { BigQuery } from '@google-cloud/bigquery';
import dotenv from 'dotenv';
import fs from 'fs'
import path from 'path';

dotenv.config();

const bigquery = new BigQuery({
  keyFilename: process.env.SERVICE_ACCOUNT,
  projectId: process.env.PROJECT_ID
});

const responseArrayDataIndex = 0;
const businessQuestions = [
  'What was the Bounce Rate by Channel?',
  'What was the Bounce Rate by Device?',
  'What was the Conversion Rate by Channel?',
  'What was the Conversion Rate by Device?',
  'What was the Conversion Rate by Landing Page?',
  'What was the revenue for each month?',
  'What was the revenue for each product?',
  'What was the revenue for each weekday?',
  'What day of the week do we have the most visitors?',
  'What was the total visits per hour on black friday?',
]
let storeQueries = [];

const directoryQueriesPath = path.join(process.cwd(), '/src/queries');

fs.readdir(directoryQueriesPath, (err, files) => { 

  files.forEach((fileName) => { 

    const filePath = path.join(process.cwd(), `/src/queries/${fileName}`);

    const content = fs.readFileSync(filePath, { encoding: 'utf-8' });

    storeQueries.push(content.replace(/\n/g, ' '));
  })
  
  storeQueries.forEach( async (query, index) => { 
    const data =  await bigquery.query(query);

    console.log(`------- Question Number ${index+1} -------`);
    console.log(businessQuestions[index]);
    console.table(data[responseArrayDataIndex]);
  })
})