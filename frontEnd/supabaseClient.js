// src/supabaseClient.js
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://qcmfqvuxuwebxbrbogje.supabase.co';
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFjbWZxdnV4dXdlYnhicmJvZ2plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM2Mjg3NzcsImV4cCI6MjAyOTIwNDc3N30.6guLDAwayVf2rL2LYgIFABXq4z1x5mWqbeEoSJJUnAo";

const supabase = createClient(supabaseUrl, supabaseKey);

export default supabase;
// yeah we dont care if the api key is leaked