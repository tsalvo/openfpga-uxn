-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 46
entity datetime_dei_0CLK_24541ec2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end datetime_dei_0CLK_24541ec2;
architecture arch of datetime_dei_0CLK_24541ec2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal device_port : unsigned(3 downto 0) := to_unsigned(0, 4);
signal REG_COMB_result : device_in_result_t;
signal REG_COMB_device_port : unsigned(3 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l543_c6_efd5]
signal BIN_OP_EQ_uxn_device_h_l543_c6_efd5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l543_c6_efd5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l543_c6_efd5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l548_c7_2c81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l543_c2_878e]
signal result_MUX_uxn_device_h_l543_c2_878e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l543_c2_878e_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l543_c2_878e_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l543_c2_878e_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l548_c11_8826]
signal BIN_OP_EQ_uxn_device_h_l548_c11_8826_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l548_c11_8826_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l548_c11_8826_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l553_c7_78e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l548_c7_2c81]
signal result_MUX_uxn_device_h_l548_c7_2c81_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l548_c7_2c81_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l548_c7_2c81_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l548_c7_2c81_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l553_c11_3291]
signal BIN_OP_EQ_uxn_device_h_l553_c11_3291_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l553_c11_3291_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l553_c11_3291_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l558_c7_60e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l553_c7_78e0]
signal result_MUX_uxn_device_h_l553_c7_78e0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l553_c7_78e0_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l553_c7_78e0_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l553_c7_78e0_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l558_c11_8f69]
signal BIN_OP_EQ_uxn_device_h_l558_c11_8f69_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l558_c11_8f69_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l558_c11_8f69_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l563_c7_305f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l558_c7_60e2]
signal result_MUX_uxn_device_h_l558_c7_60e2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l558_c7_60e2_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l558_c7_60e2_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l558_c7_60e2_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l563_c11_099e]
signal BIN_OP_EQ_uxn_device_h_l563_c11_099e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l563_c11_099e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l563_c11_099e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l568_c7_737d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l563_c7_305f]
signal result_MUX_uxn_device_h_l563_c7_305f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l563_c7_305f_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l563_c7_305f_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l563_c7_305f_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l568_c11_2996]
signal BIN_OP_EQ_uxn_device_h_l568_c11_2996_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l568_c11_2996_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l568_c11_2996_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l573_c7_1982]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l568_c7_737d]
signal result_MUX_uxn_device_h_l568_c7_737d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l568_c7_737d_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l568_c7_737d_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l568_c7_737d_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l573_c11_d62d]
signal BIN_OP_EQ_uxn_device_h_l573_c11_d62d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l573_c11_d62d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l573_c11_d62d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l578_c7_72f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l573_c7_1982]
signal result_MUX_uxn_device_h_l573_c7_1982_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l573_c7_1982_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l573_c7_1982_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l573_c7_1982_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l578_c11_bd3b]
signal BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l583_c7_9ff7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l578_c7_72f1]
signal result_MUX_uxn_device_h_l578_c7_72f1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l578_c7_72f1_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l578_c7_72f1_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l578_c7_72f1_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l583_c11_9ce1]
signal BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l588_c7_598d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l583_c7_9ff7]
signal result_MUX_uxn_device_h_l583_c7_9ff7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l583_c7_9ff7_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l583_c7_9ff7_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l583_c7_9ff7_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l588_c11_589a]
signal BIN_OP_EQ_uxn_device_h_l588_c11_589a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l588_c11_589a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l588_c11_589a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l593_c7_f9d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l588_c7_598d]
signal result_MUX_uxn_device_h_l588_c7_598d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l588_c7_598d_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l588_c7_598d_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l588_c7_598d_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l593_c11_a835]
signal BIN_OP_EQ_uxn_device_h_l593_c11_a835_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l593_c11_a835_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l593_c11_a835_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l598_c1_6b1b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l593_c7_f9d4]
signal result_MUX_uxn_device_h_l593_c7_f9d4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l593_c7_f9d4_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l593_c7_f9d4_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l593_c7_f9d4_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l599_c12_110d]
signal generic_dei_uxn_device_h_l599_c12_110d_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l599_c12_110d_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l599_c12_110d_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l599_c12_110d_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l599_c12_110d_return_output : device_in_result_t;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_device_in_result_t_device_in_result_t_5662( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return device_in_result_t is
 
  variable base : device_in_result_t; 
  variable return_output : device_in_result_t;
begin
      base.device_ram_address := ref_toks_0;
      base.dei_value := ref_toks_1;
      base.is_dei_done := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l543_c6_efd5
BIN_OP_EQ_uxn_device_h_l543_c6_efd5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l543_c6_efd5_left,
BIN_OP_EQ_uxn_device_h_l543_c6_efd5_right,
BIN_OP_EQ_uxn_device_h_l543_c6_efd5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_return_output);

-- result_MUX_uxn_device_h_l543_c2_878e
result_MUX_uxn_device_h_l543_c2_878e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l543_c2_878e_cond,
result_MUX_uxn_device_h_l543_c2_878e_iftrue,
result_MUX_uxn_device_h_l543_c2_878e_iffalse,
result_MUX_uxn_device_h_l543_c2_878e_return_output);

-- BIN_OP_EQ_uxn_device_h_l548_c11_8826
BIN_OP_EQ_uxn_device_h_l548_c11_8826 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l548_c11_8826_left,
BIN_OP_EQ_uxn_device_h_l548_c11_8826_right,
BIN_OP_EQ_uxn_device_h_l548_c11_8826_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_return_output);

-- result_MUX_uxn_device_h_l548_c7_2c81
result_MUX_uxn_device_h_l548_c7_2c81 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l548_c7_2c81_cond,
result_MUX_uxn_device_h_l548_c7_2c81_iftrue,
result_MUX_uxn_device_h_l548_c7_2c81_iffalse,
result_MUX_uxn_device_h_l548_c7_2c81_return_output);

-- BIN_OP_EQ_uxn_device_h_l553_c11_3291
BIN_OP_EQ_uxn_device_h_l553_c11_3291 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l553_c11_3291_left,
BIN_OP_EQ_uxn_device_h_l553_c11_3291_right,
BIN_OP_EQ_uxn_device_h_l553_c11_3291_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_return_output);

-- result_MUX_uxn_device_h_l553_c7_78e0
result_MUX_uxn_device_h_l553_c7_78e0 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l553_c7_78e0_cond,
result_MUX_uxn_device_h_l553_c7_78e0_iftrue,
result_MUX_uxn_device_h_l553_c7_78e0_iffalse,
result_MUX_uxn_device_h_l553_c7_78e0_return_output);

-- BIN_OP_EQ_uxn_device_h_l558_c11_8f69
BIN_OP_EQ_uxn_device_h_l558_c11_8f69 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l558_c11_8f69_left,
BIN_OP_EQ_uxn_device_h_l558_c11_8f69_right,
BIN_OP_EQ_uxn_device_h_l558_c11_8f69_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_return_output);

-- result_MUX_uxn_device_h_l558_c7_60e2
result_MUX_uxn_device_h_l558_c7_60e2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l558_c7_60e2_cond,
result_MUX_uxn_device_h_l558_c7_60e2_iftrue,
result_MUX_uxn_device_h_l558_c7_60e2_iffalse,
result_MUX_uxn_device_h_l558_c7_60e2_return_output);

-- BIN_OP_EQ_uxn_device_h_l563_c11_099e
BIN_OP_EQ_uxn_device_h_l563_c11_099e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l563_c11_099e_left,
BIN_OP_EQ_uxn_device_h_l563_c11_099e_right,
BIN_OP_EQ_uxn_device_h_l563_c11_099e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_return_output);

-- result_MUX_uxn_device_h_l563_c7_305f
result_MUX_uxn_device_h_l563_c7_305f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l563_c7_305f_cond,
result_MUX_uxn_device_h_l563_c7_305f_iftrue,
result_MUX_uxn_device_h_l563_c7_305f_iffalse,
result_MUX_uxn_device_h_l563_c7_305f_return_output);

-- BIN_OP_EQ_uxn_device_h_l568_c11_2996
BIN_OP_EQ_uxn_device_h_l568_c11_2996 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l568_c11_2996_left,
BIN_OP_EQ_uxn_device_h_l568_c11_2996_right,
BIN_OP_EQ_uxn_device_h_l568_c11_2996_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_return_output);

-- result_MUX_uxn_device_h_l568_c7_737d
result_MUX_uxn_device_h_l568_c7_737d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l568_c7_737d_cond,
result_MUX_uxn_device_h_l568_c7_737d_iftrue,
result_MUX_uxn_device_h_l568_c7_737d_iffalse,
result_MUX_uxn_device_h_l568_c7_737d_return_output);

-- BIN_OP_EQ_uxn_device_h_l573_c11_d62d
BIN_OP_EQ_uxn_device_h_l573_c11_d62d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l573_c11_d62d_left,
BIN_OP_EQ_uxn_device_h_l573_c11_d62d_right,
BIN_OP_EQ_uxn_device_h_l573_c11_d62d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_return_output);

-- result_MUX_uxn_device_h_l573_c7_1982
result_MUX_uxn_device_h_l573_c7_1982 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l573_c7_1982_cond,
result_MUX_uxn_device_h_l573_c7_1982_iftrue,
result_MUX_uxn_device_h_l573_c7_1982_iffalse,
result_MUX_uxn_device_h_l573_c7_1982_return_output);

-- BIN_OP_EQ_uxn_device_h_l578_c11_bd3b
BIN_OP_EQ_uxn_device_h_l578_c11_bd3b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_left,
BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_right,
BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_return_output);

-- result_MUX_uxn_device_h_l578_c7_72f1
result_MUX_uxn_device_h_l578_c7_72f1 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l578_c7_72f1_cond,
result_MUX_uxn_device_h_l578_c7_72f1_iftrue,
result_MUX_uxn_device_h_l578_c7_72f1_iffalse,
result_MUX_uxn_device_h_l578_c7_72f1_return_output);

-- BIN_OP_EQ_uxn_device_h_l583_c11_9ce1
BIN_OP_EQ_uxn_device_h_l583_c11_9ce1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_left,
BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_right,
BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_return_output);

-- result_MUX_uxn_device_h_l583_c7_9ff7
result_MUX_uxn_device_h_l583_c7_9ff7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l583_c7_9ff7_cond,
result_MUX_uxn_device_h_l583_c7_9ff7_iftrue,
result_MUX_uxn_device_h_l583_c7_9ff7_iffalse,
result_MUX_uxn_device_h_l583_c7_9ff7_return_output);

-- BIN_OP_EQ_uxn_device_h_l588_c11_589a
BIN_OP_EQ_uxn_device_h_l588_c11_589a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l588_c11_589a_left,
BIN_OP_EQ_uxn_device_h_l588_c11_589a_right,
BIN_OP_EQ_uxn_device_h_l588_c11_589a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_return_output);

-- result_MUX_uxn_device_h_l588_c7_598d
result_MUX_uxn_device_h_l588_c7_598d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l588_c7_598d_cond,
result_MUX_uxn_device_h_l588_c7_598d_iftrue,
result_MUX_uxn_device_h_l588_c7_598d_iffalse,
result_MUX_uxn_device_h_l588_c7_598d_return_output);

-- BIN_OP_EQ_uxn_device_h_l593_c11_a835
BIN_OP_EQ_uxn_device_h_l593_c11_a835 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l593_c11_a835_left,
BIN_OP_EQ_uxn_device_h_l593_c11_a835_right,
BIN_OP_EQ_uxn_device_h_l593_c11_a835_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_return_output);

-- result_MUX_uxn_device_h_l593_c7_f9d4
result_MUX_uxn_device_h_l593_c7_f9d4 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l593_c7_f9d4_cond,
result_MUX_uxn_device_h_l593_c7_f9d4_iftrue,
result_MUX_uxn_device_h_l593_c7_f9d4_iffalse,
result_MUX_uxn_device_h_l593_c7_f9d4_return_output);

-- generic_dei_uxn_device_h_l599_c12_110d
generic_dei_uxn_device_h_l599_c12_110d : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l599_c12_110d_CLOCK_ENABLE,
generic_dei_uxn_device_h_l599_c12_110d_device_address,
generic_dei_uxn_device_h_l599_c12_110d_phase,
generic_dei_uxn_device_h_l599_c12_110d_previous_device_ram_read,
generic_dei_uxn_device_h_l599_c12_110d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 device_port,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l543_c6_efd5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_return_output,
 result_MUX_uxn_device_h_l543_c2_878e_return_output,
 BIN_OP_EQ_uxn_device_h_l548_c11_8826_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_return_output,
 result_MUX_uxn_device_h_l548_c7_2c81_return_output,
 BIN_OP_EQ_uxn_device_h_l553_c11_3291_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_return_output,
 result_MUX_uxn_device_h_l553_c7_78e0_return_output,
 BIN_OP_EQ_uxn_device_h_l558_c11_8f69_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_return_output,
 result_MUX_uxn_device_h_l558_c7_60e2_return_output,
 BIN_OP_EQ_uxn_device_h_l563_c11_099e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_return_output,
 result_MUX_uxn_device_h_l563_c7_305f_return_output,
 BIN_OP_EQ_uxn_device_h_l568_c11_2996_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_return_output,
 result_MUX_uxn_device_h_l568_c7_737d_return_output,
 BIN_OP_EQ_uxn_device_h_l573_c11_d62d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_return_output,
 result_MUX_uxn_device_h_l573_c7_1982_return_output,
 BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_return_output,
 result_MUX_uxn_device_h_l578_c7_72f1_return_output,
 BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_return_output,
 result_MUX_uxn_device_h_l583_c7_9ff7_return_output,
 BIN_OP_EQ_uxn_device_h_l588_c11_589a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_return_output,
 result_MUX_uxn_device_h_l588_c7_598d_return_output,
 BIN_OP_EQ_uxn_device_h_l593_c11_a835_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_return_output,
 result_MUX_uxn_device_h_l593_c7_f9d4_return_output,
 generic_dei_uxn_device_h_l599_c12_110d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l543_c6_efd5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l543_c6_efd5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l543_c6_efd5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l543_c2_878e_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l543_c2_878e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l543_c2_878e_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l548_c7_2c81_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l543_c2_878e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l543_c2_878e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l544_c3_eb7b : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l548_c11_8826_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l548_c11_8826_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l548_c11_8826_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l548_c7_2c81_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l548_c7_2c81_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l548_c7_2c81_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l553_c7_78e0_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l548_c7_2c81_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l549_c3_f53c : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l553_c11_3291_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l553_c11_3291_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l553_c11_3291_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l553_c7_78e0_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l553_c7_78e0_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l553_c7_78e0_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l558_c7_60e2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l553_c7_78e0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l554_c3_3311 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l558_c11_8f69_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l558_c11_8f69_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l558_c11_8f69_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l558_c7_60e2_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l558_c7_60e2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l558_c7_60e2_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l563_c7_305f_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l558_c7_60e2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l559_c3_b61c : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l563_c11_099e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l563_c11_099e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l563_c11_099e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l563_c7_305f_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l563_c7_305f_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l563_c7_305f_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l568_c7_737d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l563_c7_305f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l564_c3_b57e : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l568_c11_2996_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l568_c11_2996_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l568_c11_2996_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l568_c7_737d_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l568_c7_737d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l568_c7_737d_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l573_c7_1982_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l568_c7_737d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l569_c3_c932 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l573_c11_d62d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l573_c11_d62d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l573_c11_d62d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l573_c7_1982_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l573_c7_1982_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l573_c7_1982_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l578_c7_72f1_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l573_c7_1982_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l574_c3_bf62 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l578_c7_72f1_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l578_c7_72f1_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l578_c7_72f1_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l583_c7_9ff7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l578_c7_72f1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l579_c3_2bf6 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l583_c7_9ff7_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l583_c7_9ff7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l583_c7_9ff7_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l588_c7_598d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l583_c7_9ff7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l584_c3_43fd : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l588_c11_589a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l588_c11_589a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l588_c11_589a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l588_c7_598d_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l588_c7_598d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l588_c7_598d_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l593_c7_f9d4_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l588_c7_598d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l589_c3_e95e : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l593_c11_a835_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l593_c11_a835_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l593_c11_a835_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l593_c7_f9d4_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l593_c7_f9d4_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l593_c7_f9d4_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l593_c7_f9d4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l594_c3_f4a6 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l599_c12_110d_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l599_c12_110d_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l599_c12_110d_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l599_c12_110d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l599_c12_110d_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
variable REG_VAR_device_port : unsigned(3 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_device_port := device_port;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_right := to_unsigned(8, 4);
     VAR_result_device_ram_address_uxn_device_h_l584_c3_43fd := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l573_c11_d62d_right := to_unsigned(6, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l568_c11_2996_right := to_unsigned(5, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l553_c11_3291_right := to_unsigned(2, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l588_c11_589a_right := to_unsigned(9, 4);
     VAR_result_device_ram_address_uxn_device_h_l574_c3_bf62 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l569_c3_c932 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l579_c3_2bf6 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l594_c3_f4a6 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l548_c11_8826_right := to_unsigned(1, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l554_c3_3311 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l564_c3_b57e := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l549_c3_f53c := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l543_c6_efd5_right := to_unsigned(0, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l593_c11_a835_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l589_c3_e95e := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l559_c3_b61c := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l558_c11_8f69_right := to_unsigned(3, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l544_c3_eb7b := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_right := to_unsigned(7, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l563_c11_099e_right := to_unsigned(4, 4);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l583_c7_9ff7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l583_c7_9ff7_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l584_c3_43fd,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l573_c7_1982] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l573_c7_1982_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l574_c3_bf62,
     to_unsigned(4, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l558_c7_60e2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l558_c7_60e2_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l559_c3_b61c,
     to_unsigned(30, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l543_c2_878e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l543_c2_878e_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l544_c3_eb7b,
     to_unsigned(7, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l578_c7_72f1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l578_c7_72f1_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l579_c3_2bf6,
     to_unsigned(5, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l588_c7_598d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l588_c7_598d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l589_c3_e95e,
     to_unsigned(108, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l563_c7_305f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l563_c7_305f_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l564_c3_b57e,
     to_unsigned(6, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l553_c7_78e0] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l553_c7_78e0_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l554_c3_3311,
     to_unsigned(11, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l548_c7_2c81] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l548_c7_2c81_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l549_c3_f53c,
     to_unsigned(190, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l593_c7_f9d4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l593_c7_f9d4_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l594_c3_f4a6,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l568_c7_737d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l568_c7_737d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l569_c3_c932,
     to_unsigned(51, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l583_c7_9ff7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l583_c7_9ff7_return_output;
     VAR_result_MUX_uxn_device_h_l558_c7_60e2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l558_c7_60e2_return_output;
     VAR_result_MUX_uxn_device_h_l588_c7_598d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l588_c7_598d_return_output;
     VAR_result_MUX_uxn_device_h_l578_c7_72f1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l578_c7_72f1_return_output;
     VAR_result_MUX_uxn_device_h_l568_c7_737d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l568_c7_737d_return_output;
     VAR_result_MUX_uxn_device_h_l553_c7_78e0_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l553_c7_78e0_return_output;
     VAR_result_MUX_uxn_device_h_l543_c2_878e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l543_c2_878e_return_output;
     VAR_result_MUX_uxn_device_h_l593_c7_f9d4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l593_c7_f9d4_return_output;
     VAR_result_MUX_uxn_device_h_l573_c7_1982_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l573_c7_1982_return_output;
     VAR_result_MUX_uxn_device_h_l548_c7_2c81_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l548_c7_2c81_return_output;
     VAR_result_MUX_uxn_device_h_l563_c7_305f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l563_c7_305f_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l599_c12_110d_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l599_c12_110d_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l599_c12_110d_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l540_c16_34c2] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l543_c6_efd5_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l548_c11_8826_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l553_c11_3291_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l558_c11_8f69_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l563_c11_099e_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l568_c11_2996_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l573_c11_d62d_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l588_c11_589a_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l593_c11_a835_left := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l540_c16_34c2_return_output;
     -- BIN_OP_EQ[uxn_device_h_l573_c11_d62d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l573_c11_d62d_left <= VAR_BIN_OP_EQ_uxn_device_h_l573_c11_d62d_left;
     BIN_OP_EQ_uxn_device_h_l573_c11_d62d_right <= VAR_BIN_OP_EQ_uxn_device_h_l573_c11_d62d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l573_c11_d62d_return_output := BIN_OP_EQ_uxn_device_h_l573_c11_d62d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l558_c11_8f69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l558_c11_8f69_left <= VAR_BIN_OP_EQ_uxn_device_h_l558_c11_8f69_left;
     BIN_OP_EQ_uxn_device_h_l558_c11_8f69_right <= VAR_BIN_OP_EQ_uxn_device_h_l558_c11_8f69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l558_c11_8f69_return_output := BIN_OP_EQ_uxn_device_h_l558_c11_8f69_return_output;

     -- BIN_OP_EQ[uxn_device_h_l578_c11_bd3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_left <= VAR_BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_left;
     BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_right <= VAR_BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_return_output := BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l568_c11_2996] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l568_c11_2996_left <= VAR_BIN_OP_EQ_uxn_device_h_l568_c11_2996_left;
     BIN_OP_EQ_uxn_device_h_l568_c11_2996_right <= VAR_BIN_OP_EQ_uxn_device_h_l568_c11_2996_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l568_c11_2996_return_output := BIN_OP_EQ_uxn_device_h_l568_c11_2996_return_output;

     -- BIN_OP_EQ[uxn_device_h_l593_c11_a835] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l593_c11_a835_left <= VAR_BIN_OP_EQ_uxn_device_h_l593_c11_a835_left;
     BIN_OP_EQ_uxn_device_h_l593_c11_a835_right <= VAR_BIN_OP_EQ_uxn_device_h_l593_c11_a835_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l593_c11_a835_return_output := BIN_OP_EQ_uxn_device_h_l593_c11_a835_return_output;

     -- BIN_OP_EQ[uxn_device_h_l553_c11_3291] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l553_c11_3291_left <= VAR_BIN_OP_EQ_uxn_device_h_l553_c11_3291_left;
     BIN_OP_EQ_uxn_device_h_l553_c11_3291_right <= VAR_BIN_OP_EQ_uxn_device_h_l553_c11_3291_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l553_c11_3291_return_output := BIN_OP_EQ_uxn_device_h_l553_c11_3291_return_output;

     -- BIN_OP_EQ[uxn_device_h_l548_c11_8826] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l548_c11_8826_left <= VAR_BIN_OP_EQ_uxn_device_h_l548_c11_8826_left;
     BIN_OP_EQ_uxn_device_h_l548_c11_8826_right <= VAR_BIN_OP_EQ_uxn_device_h_l548_c11_8826_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l548_c11_8826_return_output := BIN_OP_EQ_uxn_device_h_l548_c11_8826_return_output;

     -- BIN_OP_EQ[uxn_device_h_l583_c11_9ce1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_left <= VAR_BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_left;
     BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_right <= VAR_BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_return_output := BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l543_c6_efd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l543_c6_efd5_left <= VAR_BIN_OP_EQ_uxn_device_h_l543_c6_efd5_left;
     BIN_OP_EQ_uxn_device_h_l543_c6_efd5_right <= VAR_BIN_OP_EQ_uxn_device_h_l543_c6_efd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l543_c6_efd5_return_output := BIN_OP_EQ_uxn_device_h_l543_c6_efd5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l588_c11_589a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l588_c11_589a_left <= VAR_BIN_OP_EQ_uxn_device_h_l588_c11_589a_left;
     BIN_OP_EQ_uxn_device_h_l588_c11_589a_right <= VAR_BIN_OP_EQ_uxn_device_h_l588_c11_589a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l588_c11_589a_return_output := BIN_OP_EQ_uxn_device_h_l588_c11_589a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l563_c11_099e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l563_c11_099e_left <= VAR_BIN_OP_EQ_uxn_device_h_l563_c11_099e_left;
     BIN_OP_EQ_uxn_device_h_l563_c11_099e_right <= VAR_BIN_OP_EQ_uxn_device_h_l563_c11_099e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l563_c11_099e_return_output := BIN_OP_EQ_uxn_device_h_l563_c11_099e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_cond := VAR_BIN_OP_EQ_uxn_device_h_l543_c6_efd5_return_output;
     VAR_result_MUX_uxn_device_h_l543_c2_878e_cond := VAR_BIN_OP_EQ_uxn_device_h_l543_c6_efd5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_cond := VAR_BIN_OP_EQ_uxn_device_h_l548_c11_8826_return_output;
     VAR_result_MUX_uxn_device_h_l548_c7_2c81_cond := VAR_BIN_OP_EQ_uxn_device_h_l548_c11_8826_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l553_c11_3291_return_output;
     VAR_result_MUX_uxn_device_h_l553_c7_78e0_cond := VAR_BIN_OP_EQ_uxn_device_h_l553_c11_3291_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_cond := VAR_BIN_OP_EQ_uxn_device_h_l558_c11_8f69_return_output;
     VAR_result_MUX_uxn_device_h_l558_c7_60e2_cond := VAR_BIN_OP_EQ_uxn_device_h_l558_c11_8f69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_cond := VAR_BIN_OP_EQ_uxn_device_h_l563_c11_099e_return_output;
     VAR_result_MUX_uxn_device_h_l563_c7_305f_cond := VAR_BIN_OP_EQ_uxn_device_h_l563_c11_099e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_cond := VAR_BIN_OP_EQ_uxn_device_h_l568_c11_2996_return_output;
     VAR_result_MUX_uxn_device_h_l568_c7_737d_cond := VAR_BIN_OP_EQ_uxn_device_h_l568_c11_2996_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_cond := VAR_BIN_OP_EQ_uxn_device_h_l573_c11_d62d_return_output;
     VAR_result_MUX_uxn_device_h_l573_c7_1982_cond := VAR_BIN_OP_EQ_uxn_device_h_l573_c11_d62d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_return_output;
     VAR_result_MUX_uxn_device_h_l578_c7_72f1_cond := VAR_BIN_OP_EQ_uxn_device_h_l578_c11_bd3b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_cond := VAR_BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_return_output;
     VAR_result_MUX_uxn_device_h_l583_c7_9ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l583_c11_9ce1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l588_c11_589a_return_output;
     VAR_result_MUX_uxn_device_h_l588_c7_598d_cond := VAR_BIN_OP_EQ_uxn_device_h_l588_c11_589a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_cond := VAR_BIN_OP_EQ_uxn_device_h_l593_c11_a835_return_output;
     VAR_result_MUX_uxn_device_h_l593_c7_f9d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l593_c11_a835_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l548_c7_2c81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l548_c7_2c81_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l553_c7_78e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l553_c7_78e0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l558_c7_60e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l558_c7_60e2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l563_c7_305f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l563_c7_305f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l568_c7_737d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l568_c7_737d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l573_c7_1982] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_1982_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l578_c7_72f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l578_c7_72f1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l583_c7_9ff7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l583_c7_9ff7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l588_c7_598d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l588_c7_598d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l593_c7_f9d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l593_c7_f9d4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l598_c1_6b1b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_return_output;

     -- Submodule level 13
     VAR_generic_dei_uxn_device_h_l599_c12_110d_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l598_c1_6b1b_return_output;
     -- generic_dei[uxn_device_h_l599_c12_110d] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l599_c12_110d_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l599_c12_110d_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l599_c12_110d_device_address <= VAR_generic_dei_uxn_device_h_l599_c12_110d_device_address;
     generic_dei_uxn_device_h_l599_c12_110d_phase <= VAR_generic_dei_uxn_device_h_l599_c12_110d_phase;
     generic_dei_uxn_device_h_l599_c12_110d_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l599_c12_110d_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l599_c12_110d_return_output := generic_dei_uxn_device_h_l599_c12_110d_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l593_c7_f9d4_iffalse := VAR_generic_dei_uxn_device_h_l599_c12_110d_return_output;
     -- result_MUX[uxn_device_h_l593_c7_f9d4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l593_c7_f9d4_cond <= VAR_result_MUX_uxn_device_h_l593_c7_f9d4_cond;
     result_MUX_uxn_device_h_l593_c7_f9d4_iftrue <= VAR_result_MUX_uxn_device_h_l593_c7_f9d4_iftrue;
     result_MUX_uxn_device_h_l593_c7_f9d4_iffalse <= VAR_result_MUX_uxn_device_h_l593_c7_f9d4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l593_c7_f9d4_return_output := result_MUX_uxn_device_h_l593_c7_f9d4_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l588_c7_598d_iffalse := VAR_result_MUX_uxn_device_h_l593_c7_f9d4_return_output;
     -- result_MUX[uxn_device_h_l588_c7_598d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l588_c7_598d_cond <= VAR_result_MUX_uxn_device_h_l588_c7_598d_cond;
     result_MUX_uxn_device_h_l588_c7_598d_iftrue <= VAR_result_MUX_uxn_device_h_l588_c7_598d_iftrue;
     result_MUX_uxn_device_h_l588_c7_598d_iffalse <= VAR_result_MUX_uxn_device_h_l588_c7_598d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l588_c7_598d_return_output := result_MUX_uxn_device_h_l588_c7_598d_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l583_c7_9ff7_iffalse := VAR_result_MUX_uxn_device_h_l588_c7_598d_return_output;
     -- result_MUX[uxn_device_h_l583_c7_9ff7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l583_c7_9ff7_cond <= VAR_result_MUX_uxn_device_h_l583_c7_9ff7_cond;
     result_MUX_uxn_device_h_l583_c7_9ff7_iftrue <= VAR_result_MUX_uxn_device_h_l583_c7_9ff7_iftrue;
     result_MUX_uxn_device_h_l583_c7_9ff7_iffalse <= VAR_result_MUX_uxn_device_h_l583_c7_9ff7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l583_c7_9ff7_return_output := result_MUX_uxn_device_h_l583_c7_9ff7_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l578_c7_72f1_iffalse := VAR_result_MUX_uxn_device_h_l583_c7_9ff7_return_output;
     -- result_MUX[uxn_device_h_l578_c7_72f1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l578_c7_72f1_cond <= VAR_result_MUX_uxn_device_h_l578_c7_72f1_cond;
     result_MUX_uxn_device_h_l578_c7_72f1_iftrue <= VAR_result_MUX_uxn_device_h_l578_c7_72f1_iftrue;
     result_MUX_uxn_device_h_l578_c7_72f1_iffalse <= VAR_result_MUX_uxn_device_h_l578_c7_72f1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l578_c7_72f1_return_output := result_MUX_uxn_device_h_l578_c7_72f1_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l573_c7_1982_iffalse := VAR_result_MUX_uxn_device_h_l578_c7_72f1_return_output;
     -- result_MUX[uxn_device_h_l573_c7_1982] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l573_c7_1982_cond <= VAR_result_MUX_uxn_device_h_l573_c7_1982_cond;
     result_MUX_uxn_device_h_l573_c7_1982_iftrue <= VAR_result_MUX_uxn_device_h_l573_c7_1982_iftrue;
     result_MUX_uxn_device_h_l573_c7_1982_iffalse <= VAR_result_MUX_uxn_device_h_l573_c7_1982_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l573_c7_1982_return_output := result_MUX_uxn_device_h_l573_c7_1982_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l568_c7_737d_iffalse := VAR_result_MUX_uxn_device_h_l573_c7_1982_return_output;
     -- result_MUX[uxn_device_h_l568_c7_737d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l568_c7_737d_cond <= VAR_result_MUX_uxn_device_h_l568_c7_737d_cond;
     result_MUX_uxn_device_h_l568_c7_737d_iftrue <= VAR_result_MUX_uxn_device_h_l568_c7_737d_iftrue;
     result_MUX_uxn_device_h_l568_c7_737d_iffalse <= VAR_result_MUX_uxn_device_h_l568_c7_737d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l568_c7_737d_return_output := result_MUX_uxn_device_h_l568_c7_737d_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l563_c7_305f_iffalse := VAR_result_MUX_uxn_device_h_l568_c7_737d_return_output;
     -- result_MUX[uxn_device_h_l563_c7_305f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l563_c7_305f_cond <= VAR_result_MUX_uxn_device_h_l563_c7_305f_cond;
     result_MUX_uxn_device_h_l563_c7_305f_iftrue <= VAR_result_MUX_uxn_device_h_l563_c7_305f_iftrue;
     result_MUX_uxn_device_h_l563_c7_305f_iffalse <= VAR_result_MUX_uxn_device_h_l563_c7_305f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l563_c7_305f_return_output := result_MUX_uxn_device_h_l563_c7_305f_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l558_c7_60e2_iffalse := VAR_result_MUX_uxn_device_h_l563_c7_305f_return_output;
     -- result_MUX[uxn_device_h_l558_c7_60e2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l558_c7_60e2_cond <= VAR_result_MUX_uxn_device_h_l558_c7_60e2_cond;
     result_MUX_uxn_device_h_l558_c7_60e2_iftrue <= VAR_result_MUX_uxn_device_h_l558_c7_60e2_iftrue;
     result_MUX_uxn_device_h_l558_c7_60e2_iffalse <= VAR_result_MUX_uxn_device_h_l558_c7_60e2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l558_c7_60e2_return_output := result_MUX_uxn_device_h_l558_c7_60e2_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l553_c7_78e0_iffalse := VAR_result_MUX_uxn_device_h_l558_c7_60e2_return_output;
     -- result_MUX[uxn_device_h_l553_c7_78e0] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l553_c7_78e0_cond <= VAR_result_MUX_uxn_device_h_l553_c7_78e0_cond;
     result_MUX_uxn_device_h_l553_c7_78e0_iftrue <= VAR_result_MUX_uxn_device_h_l553_c7_78e0_iftrue;
     result_MUX_uxn_device_h_l553_c7_78e0_iffalse <= VAR_result_MUX_uxn_device_h_l553_c7_78e0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l553_c7_78e0_return_output := result_MUX_uxn_device_h_l553_c7_78e0_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l548_c7_2c81_iffalse := VAR_result_MUX_uxn_device_h_l553_c7_78e0_return_output;
     -- result_MUX[uxn_device_h_l548_c7_2c81] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l548_c7_2c81_cond <= VAR_result_MUX_uxn_device_h_l548_c7_2c81_cond;
     result_MUX_uxn_device_h_l548_c7_2c81_iftrue <= VAR_result_MUX_uxn_device_h_l548_c7_2c81_iftrue;
     result_MUX_uxn_device_h_l548_c7_2c81_iffalse <= VAR_result_MUX_uxn_device_h_l548_c7_2c81_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l548_c7_2c81_return_output := result_MUX_uxn_device_h_l548_c7_2c81_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l543_c2_878e_iffalse := VAR_result_MUX_uxn_device_h_l548_c7_2c81_return_output;
     -- result_MUX[uxn_device_h_l543_c2_878e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l543_c2_878e_cond <= VAR_result_MUX_uxn_device_h_l543_c2_878e_cond;
     result_MUX_uxn_device_h_l543_c2_878e_iftrue <= VAR_result_MUX_uxn_device_h_l543_c2_878e_iftrue;
     result_MUX_uxn_device_h_l543_c2_878e_iffalse <= VAR_result_MUX_uxn_device_h_l543_c2_878e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l543_c2_878e_return_output := result_MUX_uxn_device_h_l543_c2_878e_return_output;

     -- Submodule level 25
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l543_c2_878e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l543_c2_878e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_port <= REG_VAR_device_port;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     device_port <= REG_COMB_device_port;
 end if;
 end if;
end process;

end arch;
