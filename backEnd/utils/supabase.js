const supabasetool = require("@supabase/supabase-js")
const supabaseUrl = 'https://qcmfqvuxuwebxbrbogje.supabase.co'
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFjbWZxdnV4dXdlYnhicmJvZ2plIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM2Mjg3NzcsImV4cCI6MjAyOTIwNDc3N30.6guLDAwayVf2rL2LYgIFABXq4z1x5mWqbeEoSJJUnAo"
const supabase = supabasetool.createClient(supabaseUrl, supabaseKey)

module.exports = supabase
