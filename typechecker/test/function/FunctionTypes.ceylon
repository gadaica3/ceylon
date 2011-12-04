String upper(String s) {
   return s.uppercased;
}

void print(String s) {}

class X(String s) {
    shared class Y() {}
    shared void hello() {}
}

void noop() {}

void higher1(String[] strings, Callable<Void,String> f) {}

void higher2(String[] strings, void f(String str)) {
    for (s in strings) {
        f(s);
    }
    @error f(1);
    @error f();
    @error f("hello", 2);
}

String str(Float f) { return f.string; }

void method() {
    Callable<String,String> upperRef = upper;
    Callable<Void,String> printRef = print;    
    Callable<X,String> xRef = X;
    X x = X("hello");
    Callable<X.Y> yRef = x.Y;
    Callable<Void> helloRef = x.hello;
    Callable<Void> noopRef = noop;
    
    higher1({"hello", "world"}, print);
    higher1({"hello", "world"}, upper);
    higher1({"hello", "world"}, X);
    @error higher1({"hello", "world"}, noop);
    @error higher1({"hello", "world"}, str);
    
    higher2({"hello", "world"}, print);
    higher2({"hello", "world"}, upper);
    higher2({"hello", "world"}, X);
    @error higher2({"hello", "world"}, noop);
    @error higher2({"hello", "world"}, str);
    
    @type["String"] function up(String s) = upper;
    void pr(String s) = print;
    void np() = noop;
    
    @type["String"] up("hello");
    @type["Void"] pr("hello");
    @type["Void"] np();
    
    @type["X"] function good(String s) = X;
    X better(String s) = X;
    @type["X"] @error function bad() = X;
    @type["X"] @error function badder(Natural n) = X;
    @error String worse(String s) = X;
    @error String worst() = X;
    @error void broke() = noop();
    
    higher2 { 
        strings = {"goodbye"};
        void f(String s) { print(s); }
    };
    higher2 { 
        strings = {"goodbye"};
        Natural f(String s) { print(s); return s.size; }
    };
    higher2 { 
        strings = {"goodbye"};
        @error void f(Natural n) { print(n.string); }
    };
}

class Outer() {
    class Inner() {}
    Outer.Inner oi = Outer.Inner();
}