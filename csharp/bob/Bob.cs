using System;

public class Bob
{
    public static string Hey (string message)
    {
        if (IsExclamation(message))
            return "Whoa, chill out!";
        if (IsQuestion(message))
            return "Sure.";
        if (IsSilence(message))
            return "Fine. Be that way!";
        return "Whatever.";
    }

    private static bool IsExclamation (string message)
    {
        return message == message.ToUpper() && message != message.ToLower();
    }

    private static bool IsQuestion (string message)
    {
        return message.Trim().EndsWith("?");
    }

    private static bool IsSilence (string message)
    {
        return message.Trim() == "";
    }
}
