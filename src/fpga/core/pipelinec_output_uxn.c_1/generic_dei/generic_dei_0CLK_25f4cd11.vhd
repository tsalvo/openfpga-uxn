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
-- Submodules: 9
entity generic_dei_0CLK_25f4cd11 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end generic_dei_0CLK_25f4cd11;
architecture arch of generic_dei_0CLK_25f4cd11 is
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
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l255_c6_bf7e]
signal BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l255_c2_4d5b]
signal result_MUX_uxn_device_h_l255_c2_4d5b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l255_c2_4d5b_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l255_c2_4d5b_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l255_c2_4d5b_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l260_c11_1e0e]
signal BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l260_c7_23b2]
signal result_MUX_uxn_device_h_l260_c7_23b2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l260_c7_23b2_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l260_c7_23b2_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l260_c7_23b2_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l265_c11_dcd3]
signal BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l265_c7_31dd]
signal result_MUX_uxn_device_h_l265_c7_31dd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l265_c7_31dd_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l265_c7_31dd_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l265_c7_31dd_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l255_c6_bf7e
BIN_OP_EQ_uxn_device_h_l255_c6_bf7e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_left,
BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_right,
BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_return_output);

-- result_MUX_uxn_device_h_l255_c2_4d5b
result_MUX_uxn_device_h_l255_c2_4d5b : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l255_c2_4d5b_cond,
result_MUX_uxn_device_h_l255_c2_4d5b_iftrue,
result_MUX_uxn_device_h_l255_c2_4d5b_iffalse,
result_MUX_uxn_device_h_l255_c2_4d5b_return_output);

-- BIN_OP_EQ_uxn_device_h_l260_c11_1e0e
BIN_OP_EQ_uxn_device_h_l260_c11_1e0e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_left,
BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_right,
BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_return_output);

-- result_MUX_uxn_device_h_l260_c7_23b2
result_MUX_uxn_device_h_l260_c7_23b2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l260_c7_23b2_cond,
result_MUX_uxn_device_h_l260_c7_23b2_iftrue,
result_MUX_uxn_device_h_l260_c7_23b2_iffalse,
result_MUX_uxn_device_h_l260_c7_23b2_return_output);

-- BIN_OP_EQ_uxn_device_h_l265_c11_dcd3
BIN_OP_EQ_uxn_device_h_l265_c11_dcd3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_left,
BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_right,
BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_return_output);

-- result_MUX_uxn_device_h_l265_c7_31dd
result_MUX_uxn_device_h_l265_c7_31dd : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l265_c7_31dd_cond,
result_MUX_uxn_device_h_l265_c7_31dd_iftrue,
result_MUX_uxn_device_h_l265_c7_31dd_iffalse,
result_MUX_uxn_device_h_l265_c7_31dd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_return_output,
 result_MUX_uxn_device_h_l255_c2_4d5b_return_output,
 BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_return_output,
 result_MUX_uxn_device_h_l260_c7_23b2_return_output,
 BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_return_output,
 result_MUX_uxn_device_h_l265_c7_31dd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l255_c2_4d5b_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l255_c2_4d5b_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l255_c2_4d5b_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l260_c7_23b2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l255_c2_4d5b_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l255_c2_4d5b_cond : unsigned(0 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l257_c3_477e : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l260_c7_23b2_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l260_c7_23b2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l260_c7_23b2_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l265_c7_31dd_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l260_c7_23b2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l261_c3_a4c1 : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l262_c3_332a : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l265_c7_31dd_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l265_c7_31dd_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l265_c7_31dd_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l265_c7_31dd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l266_c3_b40a : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_device_h_l266_c3_b40a := resize(to_unsigned(0, 1), 8);
     VAR_result_dei_value_uxn_device_h_l262_c3_332a := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_right := to_unsigned(1, 1);
     VAR_result_dei_value_uxn_device_h_l257_c3_477e := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l261_c3_a4c1 := resize(to_unsigned(0, 1), 8);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l260_c7_23b2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l260_c7_23b2_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l261_c3_a4c1,
     VAR_result_dei_value_uxn_device_h_l262_c3_332a,
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l260_c7_23b2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l260_c7_23b2_return_output;

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
     VAR_BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_left := VAR_phase;
     VAR_result_MUX_uxn_device_h_l265_c7_31dd_iffalse := result;
     -- BIN_OP_EQ[uxn_device_h_l265_c11_dcd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_left <= VAR_BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_left;
     BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_right <= VAR_BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_return_output := BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l265_c7_31dd] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l265_c7_31dd_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l266_c3_b40a,
     VAR_previous_device_ram_read,
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l255_c2_4d5b] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l255_c2_4d5b_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_device_address,
     VAR_result_dei_value_uxn_device_h_l257_c3_477e,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_device_h_l255_c6_bf7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_left <= VAR_BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_left;
     BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_right <= VAR_BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_return_output := BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l260_c11_1e0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_left <= VAR_BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_left;
     BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_right <= VAR_BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_return_output := BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_return_output;

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l255_c2_4d5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l255_c6_bf7e_return_output;
     VAR_result_MUX_uxn_device_h_l260_c7_23b2_cond := VAR_BIN_OP_EQ_uxn_device_h_l260_c11_1e0e_return_output;
     VAR_result_MUX_uxn_device_h_l265_c7_31dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l265_c11_dcd3_return_output;
     VAR_result_MUX_uxn_device_h_l255_c2_4d5b_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l255_c2_4d5b_return_output;
     VAR_result_MUX_uxn_device_h_l265_c7_31dd_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l265_c7_31dd_return_output;
     -- result_MUX[uxn_device_h_l265_c7_31dd] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l265_c7_31dd_cond <= VAR_result_MUX_uxn_device_h_l265_c7_31dd_cond;
     result_MUX_uxn_device_h_l265_c7_31dd_iftrue <= VAR_result_MUX_uxn_device_h_l265_c7_31dd_iftrue;
     result_MUX_uxn_device_h_l265_c7_31dd_iffalse <= VAR_result_MUX_uxn_device_h_l265_c7_31dd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l265_c7_31dd_return_output := result_MUX_uxn_device_h_l265_c7_31dd_return_output;

     -- Submodule level 2
     VAR_result_MUX_uxn_device_h_l260_c7_23b2_iffalse := VAR_result_MUX_uxn_device_h_l265_c7_31dd_return_output;
     -- result_MUX[uxn_device_h_l260_c7_23b2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l260_c7_23b2_cond <= VAR_result_MUX_uxn_device_h_l260_c7_23b2_cond;
     result_MUX_uxn_device_h_l260_c7_23b2_iftrue <= VAR_result_MUX_uxn_device_h_l260_c7_23b2_iftrue;
     result_MUX_uxn_device_h_l260_c7_23b2_iffalse <= VAR_result_MUX_uxn_device_h_l260_c7_23b2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l260_c7_23b2_return_output := result_MUX_uxn_device_h_l260_c7_23b2_return_output;

     -- Submodule level 3
     VAR_result_MUX_uxn_device_h_l255_c2_4d5b_iffalse := VAR_result_MUX_uxn_device_h_l260_c7_23b2_return_output;
     -- result_MUX[uxn_device_h_l255_c2_4d5b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l255_c2_4d5b_cond <= VAR_result_MUX_uxn_device_h_l255_c2_4d5b_cond;
     result_MUX_uxn_device_h_l255_c2_4d5b_iftrue <= VAR_result_MUX_uxn_device_h_l255_c2_4d5b_iftrue;
     result_MUX_uxn_device_h_l255_c2_4d5b_iffalse <= VAR_result_MUX_uxn_device_h_l255_c2_4d5b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l255_c2_4d5b_return_output := result_MUX_uxn_device_h_l255_c2_4d5b_return_output;

     -- Submodule level 4
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l255_c2_4d5b_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l255_c2_4d5b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
