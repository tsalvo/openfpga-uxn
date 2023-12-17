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
-- Submodules: 58
entity lth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_609876da;
architecture arch of lth2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1947_c6_c377]
signal BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal t16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1947_c2_ff79]
signal n16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_39ed]
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_5ec0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_5ec0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_5ec0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_5ec0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1960_c7_5ec0]
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1960_c7_5ec0]
signal t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1960_c7_5ec0]
signal n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_d0e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_b9f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_b9f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_b9f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_b9f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1963_c7_b9f0]
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1963_c7_b9f0]
signal t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1963_c7_b9f0]
signal n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_fbbc]
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_6f03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_6f03]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_6f03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_6f03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1968_c7_6f03]
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1968_c7_6f03]
signal t16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1968_c7_6f03]
signal n16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1969_c3_55df]
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_baab]
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_5786]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_5786]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1972_c7_5786]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_5786]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1972_c7_5786]
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1972_c7_5786]
signal n16_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1976_c11_f48e]
signal BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1976_c7_59cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1976_c7_59cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1976_c7_59cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1976_c7_59cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1976_c7_59cb]
signal result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1976_c7_59cb]
signal n16_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1977_c3_1690]
signal BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1978_c30_5697]
signal sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1981_c21_d4dd]
signal BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1981_c21_7e0b]
signal MUX_uxn_opcodes_h_l1981_c21_7e0b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1981_c21_7e0b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1981_c21_7e0b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1981_c21_7e0b_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e848( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377
BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_left,
BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_right,
BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79
result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79
result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79
result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79
result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- t16_MUX_uxn_opcodes_h_l1947_c2_ff79
t16_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
t16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- n16_MUX_uxn_opcodes_h_l1947_c2_ff79
n16_MUX_uxn_opcodes_h_l1947_c2_ff79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond,
n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue,
n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse,
n16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_left,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_right,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output);

-- t16_MUX_uxn_opcodes_h_l1960_c7_5ec0
t16_MUX_uxn_opcodes_h_l1960_c7_5ec0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond,
t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue,
t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse,
t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output);

-- n16_MUX_uxn_opcodes_h_l1960_c7_5ec0
n16_MUX_uxn_opcodes_h_l1960_c7_5ec0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond,
n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue,
n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse,
n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output);

-- t16_MUX_uxn_opcodes_h_l1963_c7_b9f0
t16_MUX_uxn_opcodes_h_l1963_c7_b9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond,
t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue,
t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse,
t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output);

-- n16_MUX_uxn_opcodes_h_l1963_c7_b9f0
n16_MUX_uxn_opcodes_h_l1963_c7_b9f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond,
n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue,
n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse,
n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_left,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_right,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_cond,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output);

-- t16_MUX_uxn_opcodes_h_l1968_c7_6f03
t16_MUX_uxn_opcodes_h_l1968_c7_6f03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond,
t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue,
t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse,
t16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output);

-- n16_MUX_uxn_opcodes_h_l1968_c7_6f03
n16_MUX_uxn_opcodes_h_l1968_c7_6f03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond,
n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue,
n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse,
n16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df
BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_left,
BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_right,
BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_left,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_right,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_cond,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_return_output);

-- n16_MUX_uxn_opcodes_h_l1972_c7_5786
n16_MUX_uxn_opcodes_h_l1972_c7_5786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1972_c7_5786_cond,
n16_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue,
n16_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse,
n16_MUX_uxn_opcodes_h_l1972_c7_5786_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e
BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_left,
BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_right,
BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb
result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb
result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb
result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1976_c7_59cb
n16_MUX_uxn_opcodes_h_l1976_c7_59cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1976_c7_59cb_cond,
n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue,
n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse,
n16_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690
BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_left,
BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_right,
BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1978_c30_5697
sp_relative_shift_uxn_opcodes_h_l1978_c30_5697 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_ins,
sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_x,
sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_y,
sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd
BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_left,
BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_right,
BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_return_output);

-- MUX_uxn_opcodes_h_l1981_c21_7e0b
MUX_uxn_opcodes_h_l1981_c21_7e0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1981_c21_7e0b_cond,
MUX_uxn_opcodes_h_l1981_c21_7e0b_iftrue,
MUX_uxn_opcodes_h_l1981_c21_7e0b_iffalse,
MUX_uxn_opcodes_h_l1981_c21_7e0b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50
CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 t16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 n16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output,
 t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output,
 n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output,
 t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output,
 n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output,
 t16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output,
 n16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_return_output,
 n16_MUX_uxn_opcodes_h_l1972_c7_5786_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output,
 n16_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_return_output,
 sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_return_output,
 MUX_uxn_opcodes_h_l1981_c21_7e0b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1952_c3_2b73 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_89f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_08ef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_5fa0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_545a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1980_c3_6088 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_05b9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_5f3e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_fa01_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_3a4e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1977_l1969_l1973_DUPLICATE_aae9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1976_DUPLICATE_e8c6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1985_l1943_DUPLICATE_8ebd_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_545a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_545a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1980_c3_6088 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1980_c3_6088;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1952_c3_2b73 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1952_c3_2b73;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_08ef := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_08ef;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_5fa0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_5fa0;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_89f5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_89f5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_05b9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_05b9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_fbbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_3a4e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_3a4e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1976_DUPLICATE_e8c6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1976_DUPLICATE_e8c6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1947_c6_c377] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_left;
     BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output := BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1977_l1969_l1973_DUPLICATE_aae9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1977_l1969_l1973_DUPLICATE_aae9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_fa01 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_fa01_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1978_c30_5697] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_ins;
     sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_x;
     sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_return_output := sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_5f3e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_5f3e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_d0e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_39ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_baab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1976_c11_f48e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c6_c377_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_39ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_d0e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_fbbc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_baab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1976_c11_f48e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1977_l1969_l1973_DUPLICATE_aae9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1977_l1969_l1973_DUPLICATE_aae9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1977_l1969_l1973_DUPLICATE_aae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_fa01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_fa01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_fa01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_fa01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_fa01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_3a4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_3a4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_3a4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_3a4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_3a4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_5f3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_5f3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_5f3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_5f3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_DUPLICATE_5f3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1976_DUPLICATE_e8c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1972_l1976_DUPLICATE_e8c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_05b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_05b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_05b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_05b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_05b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1976_l1972_l1968_l1963_l1960_l1947_DUPLICATE_05b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1947_c2_ff79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1978_c30_5697_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1969_c3_55df] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_left;
     BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_return_output := BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1977_c3_1690] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_left;
     BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_return_output := BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1976_c7_59cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1976_c7_59cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1976_c7_59cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1976_c7_59cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1969_c3_55df_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1977_c3_1690_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1974_DUPLICATE_cd50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_5786] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_5786] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_5786] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;

     -- n16_MUX[uxn_opcodes_h_l1976_c7_59cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1976_c7_59cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_cond;
     n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue;
     n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output := n16_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1981_c21_d4dd] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_left;
     BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_return_output := BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1968_c7_6f03] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond;
     t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue;
     t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output := t16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1972_c7_5786] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1981_c21_d4dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;
     -- MUX[uxn_opcodes_h_l1981_c21_7e0b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1981_c21_7e0b_cond <= VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_cond;
     MUX_uxn_opcodes_h_l1981_c21_7e0b_iftrue <= VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_iftrue;
     MUX_uxn_opcodes_h_l1981_c21_7e0b_iffalse <= VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_return_output := MUX_uxn_opcodes_h_l1981_c21_7e0b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_6f03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_6f03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;

     -- t16_MUX[uxn_opcodes_h_l1963_c7_b9f0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond;
     t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue;
     t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output := t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_6f03] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;

     -- n16_MUX[uxn_opcodes_h_l1972_c7_5786] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1972_c7_5786_cond <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_cond;
     n16_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue;
     n16_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_return_output := n16_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_6f03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue := VAR_MUX_uxn_opcodes_h_l1981_c21_7e0b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;
     -- t16_MUX[uxn_opcodes_h_l1960_c7_5ec0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond;
     t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue;
     t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output := t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_b9f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1968_c7_6f03] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_cond;
     n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue;
     n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output := n16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1976_c7_59cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_b9f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_b9f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_b9f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1976_c7_59cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_5ec0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_5ec0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := t16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- n16_MUX[uxn_opcodes_h_l1963_c7_b9f0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond;
     n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue;
     n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output := n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_5ec0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_5ec0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1972_c7_5786] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_return_output := result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1972_c7_5786_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;
     -- n16_MUX[uxn_opcodes_h_l1960_c7_5ec0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond;
     n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue;
     n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output := n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1968_c7_6f03] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output := result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_6f03_return_output;
     -- n16_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := n16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1963_c7_b9f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_b9f0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1960_c7_5ec0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_5ec0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1947_c2_ff79] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output := result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1985_l1943_DUPLICATE_8ebd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1985_l1943_DUPLICATE_8ebd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c2_ff79_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1985_l1943_DUPLICATE_8ebd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1985_l1943_DUPLICATE_8ebd_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
